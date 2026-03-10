class CartItemModel {
  final String productId;
  final int quantity;

  CartItemModel({
    required this.productId,
    required this.quantity,
  });

  CartItemModel copyWith({
    int? quantity,
  }) {
    return CartItemModel(
      productId: productId,
      quantity: quantity ?? this.quantity,
    );
  }
}