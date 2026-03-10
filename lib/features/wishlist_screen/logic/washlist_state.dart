part of 'washlist_cubit.dart';

enum WashlistStatus { initial, loading, success, error }

@immutable
class WashlistState {
  final WashlistStatus status;
  final String message;
  final List<WashlistEntity> washlistEntity;

  // final List<WashlistProductModels>washlistProduct;

  final List<ProductModel> favoriteProducts;

  WashlistState({
    this.favoriteProducts = const [],
    this.status = WashlistStatus.initial,
    this.message = '',
    this.washlistEntity = const [],
  });

  WashlistState copyWith({
    WashlistStatus? status,
    String? message,
    List<WashlistEntity>? washlistEntity,
    List<ProductModel>? favoriteProducts,
  }) {
    return WashlistState(
      status: status ?? this.status,
      message: message ?? this.message,
      washlistEntity: washlistEntity ?? this.washlistEntity,
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
    );
  }
}
