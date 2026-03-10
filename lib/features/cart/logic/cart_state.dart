part of 'cart_cubit.dart';

enum CartStatus { intial,loading, success, error }

@immutable
class CartState {
  final CartStatus status;
  final int quantity;
  final List<CartItemModel> cartItems;
  final List<CartEntity> cartEntity;
  final List<CartProductModel> cartProducts;
  final double totalCartPrice;
  final int noOfCartItems;
  final double? subTotal;
  final double? shippingFee;
  final double? taxFee;
  final double? totalPrice;
  final String? message;

  CartState({
    this.status = CartStatus.intial,
    this.quantity = 1,
    this.cartItems = const [],
    this.cartProducts = const [],
    this.totalCartPrice = 0.0,
    this.noOfCartItems = 0,
    this.subTotal = 0.0,
    this.shippingFee = 0.0,
    this.taxFee = 0.0,
    this.totalPrice = 0.0,
    this.cartEntity = const [],
    this.message = "",
  });

  CartState copyWith({
    CartStatus? status,
    int? quantity,
    List<CartItemModel>? cartItems,
    double? totalCartPrice,
    int? noOfCartItems,
    double? subTotal,
    double? shippingFee,
    double? taxFee,
    double? totalPrice,
    List<CartEntity>? cartEntity,
    List<CartProductModel>? cartProducts,
    String? message,
  }) {
    return CartState(
      status: status ?? this.status,
      quantity: quantity ?? this.quantity,
      cartItems: cartItems ?? this.cartItems,
      totalCartPrice: totalCartPrice ?? this.totalCartPrice,
      noOfCartItems: noOfCartItems ?? this.noOfCartItems,
      subTotal: subTotal ?? this.subTotal,
      shippingFee: shippingFee ?? this.shippingFee,
      taxFee: taxFee ?? this.taxFee,
      totalPrice: totalPrice ?? this.totalPrice,
      cartEntity: cartEntity ?? this.cartEntity,
      cartProducts: cartProducts ?? this.cartProducts,
      message: message ?? this.message,
    );
  }
}
