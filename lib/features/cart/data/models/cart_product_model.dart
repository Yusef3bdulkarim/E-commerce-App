import '../../../products/data/models/product_model.dart';

class CartProductModel {
  final ProductModel product;
  final int quantity;

  CartProductModel({
    required this.product,
    required this.quantity,
  });

  double get totalPrice => product.price * quantity;
}