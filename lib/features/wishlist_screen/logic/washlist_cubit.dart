import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/core/service_git_it/service_locator.dart';
import 'package:ecommerceapp/features/wishlist_screen/data/models/washlist_entity.dart';
import 'package:ecommerceapp/features/wishlist_screen/data/models/washlist_product_models.dart';
import 'package:ecommerceapp/features/wishlist_screen/data/repo/washlist_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../products/data/models/product_model.dart';

part 'washlist_state.dart';

class WashlistCubit extends Cubit<WashlistState> {
  WashlistCubit() : super(WashlistState()) {
    _monitorAuthState();
  }

  final repo = getIt<WashlistRepo>();
  StreamSubscription? _wishlistSubscription;
  StreamSubscription? _authSubscription;

  void _monitorAuthState() {
    _authSubscription?.cancel();
    _authSubscription = getIt<FirebaseAuth>().authStateChanges().listen((user) {
      if (user != null)
        load();
      else
        _resetWishlist();
    });
  }

  void _resetWishlist() {
    _wishlistSubscription?.cancel();
    emit(WashlistState()); // بيرجع الـ State فاضية تماماً
  }

  void load() {
    emit(state.copyWith(status: WashlistStatus.loading));
    _wishlistSubscription?.cancel();
    _wishlistSubscription = repo.getWishlistStream().listen(
      (snapshotWishlist) async {
        if (snapshotWishlist.docs.isEmpty) {
          emit(
            state.copyWith(
              washlistEntity: [],
              favoriteProducts: [],
              status: WashlistStatus.success,
            ),
          );
          return;
        }
        final productId = snapshotWishlist.docs.map((doc) => doc.id).toList();
        final entities = snapshotWishlist.docs
            .map((doc) => WashlistEntity.fromDoc(doc))
            .toList();

        final productSnapshot = await FirebaseFirestore.instance
            .collection('products')
            .where(FieldPath.documentId, whereIn: productId)
            .get();

        final products = productSnapshot.docs
            .map((e) => ProductModel.fromSnapshot(e))
            .toList();

        emit(
          state.copyWith(
            washlistEntity: entities,
            favoriteProducts: products,
            status: WashlistStatus.success,
          ),
        );
      },
      onError: (error) {
        emit(state.copyWith(status: WashlistStatus.error, message: error));
      },
    );
  }

  Future<void> toggleFavorite(ProductModel product) async {
    try {
      await repo.toggleWishlist(product.id);
    } catch (e) {
      emit(state.copyWith(status: WashlistStatus.error, message: e.toString()));
    }
  }

  bool isFavorite(String productId) {
    return state.favoriteProducts.any((p) => p.id == productId);
  }

  void toggleFavoriteLocal(ProductModel product) {
    final updatedList = List<ProductModel>.from(state.favoriteProducts);
    if (updatedList.any((p) => p.id == product.id)) {
      updatedList.removeWhere((p) => p.id == product.id);
    } else {
      updatedList.add(product);
    }

    emit(state.copyWith(favoriteProducts: updatedList));
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    _wishlistSubscription?.cancel();
    return super.close();
  }
}
