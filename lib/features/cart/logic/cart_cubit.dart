import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/core/service_git_it/service_locator.dart';
import 'package:ecommerceapp/features/cart/data/models/cart_entity.dart';
import 'package:ecommerceapp/features/cart/data/repo/cart_repo.dart';
import 'package:ecommerceapp/features/checkout/data/repo/order_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../products/data/models/product_model.dart';
import '../data/models/cart_model.dart';
import '../data/models/cart_product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final repo = getIt<CartRepo>();
  final orderRepo = getIt<OrderRepository>();

  CartCubit() : super(CartState()) {
    _monitorAuthState();
  }

  StreamSubscription? _authSubscription;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _productsSubscription;

  void _monitorAuthState() {
    _authSubscription?.cancel();
    // بنراقب حالة الـ Auth في الـ Firebase
    _authSubscription = getIt<FirebaseAuth>().authStateChanges().listen((user) {
      if (user != null) {
        // لو فيه يوزر دخل، حمل بياناته
        loadCart();
      } else {
        // لو اليوزر خرج، صفر كل حاجة واقفل الـ Streams
        _resetCart();
      }
    });
  }

  void _resetCart() {
    _cartSubscription?.cancel();
    emit(CartState()); // بيرجع الـ State للحالة الابتدائية (قائمة فاضية)
  }

  void loadCart() {
    _cartSubscription?.cancel();
    _cartSubscription = repo.getCartStream().listen((cartSnapshot) async {
      if (cartSnapshot.docs.isEmpty) {
        emit(
          state.copyWith(cartProducts: [], totalCartPrice: 0, noOfCartItems: 0),
        );
        return;
      }
      final cartItems = cartSnapshot.docs
          .map((doc) => CartEntity.fromDoc(doc))
          .toList();
      final productIds = cartItems.map((e) => e.productId).toList();
      final productsSnapshot = await FirebaseFirestore.instance
          .collection('products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      final products = productsSnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();

      final merged = cartItems
          .map((cartItem) {
            final product = products.firstWhere(
              (p) => p.id == cartItem.productId,
              orElse: () {
                return ProductModel.empty();
              },
            );
            return CartProductModel(
              product: product,
              quantity: cartItem.quantity,
            );
          })
          .where((item) => item.product.id.isNotEmpty)
          .toList();
      double totalPrice = merged.fold(0, (sum, item) => sum + item.totalPrice);
      int totalCount = merged.fold(0, (sum, item) => sum + item.quantity);

      emit(
        state.copyWith(
          cartProducts: merged,
          totalCartPrice: totalPrice,
          noOfCartItems: totalCount,
        ),
      );
    });
  }

  Future<void> add(ProductModel product) async {
    await repo.addToCart(product.id, state.quantity);
    emit(state.copyWith(status: CartStatus.success, quantity: 1));
  }

  Future<void> remove(String productId) async {
    await repo.removeFromCart(productId);
  }

  Future<void> changeQuantity(String productId, int quantity) async {
    await repo.updateQuantity(productId, quantity);
  }

  void updateQuantity(bool isIncrement) {
    if (isIncrement) {
      emit(state.copyWith(quantity: state.quantity + 1));
    } else {
      if (state.quantity > 1) {
        emit(state.copyWith(quantity: state.quantity - 1));
      }
    }
  }

  void mergeCartWithProducts(List<ProductModel> allProducts) {
    final merged = state.cartItems.map((cartItem) {
      final product = allProducts.firstWhere((p) => p.id == cartItem.productId);

      return CartProductModel(product: product, quantity: cartItem.quantity);
    }).toList();

    double totalPrice = merged.fold(0, (sum, item) => sum + item.totalPrice);

    int totalCount = merged.fold(0, (sum, item) => sum + item.quantity);

    emit(
      state.copyWith(
        cartProducts: merged,
        totalCartPrice: totalPrice,
        noOfCartItems: totalCount,
      ),
    );
  }

  void getCheckoutDetails() {
    double subTotal = state.totalCartPrice;

    double shipping = 5.0;
    double taxRate = 0.1;
    double tax = subTotal * taxRate;
    double total = subTotal + shipping + tax;

    emit(
      state.copyWith(
        status: CartStatus.success,
        subTotal: subTotal,
        shippingFee: shipping,
        taxFee: tax,
        totalPrice: total,
      ),
    );
  }

  Future<void> confirmCheckout() async {
    if (state.cartProducts.isEmpty) return;

    emit(state.copyWith(status: CartStatus.loading));

    final items = state.cartProducts.map((item) {
      return {
        'productId': item.product.id,
        'quantity': item.quantity,
        'priceAtPurchase': item.product.price,
      };
    }).toList();

    double subTotal = state.totalCartPrice;
    double shipping = 5.0;
    double tax = subTotal * 0.1;
    double total = subTotal + shipping + tax;

    try {
      await orderRepo.createOrder(
        items: items,
        subTotal: subTotal,
        shipping: shipping,
        tax: tax,
        total: total,
      );

      emit(
        state.copyWith(
          status: CartStatus.success,
          cartProducts: [],
          totalCartPrice: 0,
          noOfCartItems: 0,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: CartStatus.error, message: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    _cartSubscription?.cancel();
    _productsSubscription?.cancel();
    return super.close();
  }
}
