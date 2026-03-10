import 'package:equatable/equatable.dart';

class ProductVariationModel extends Equatable {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    required this.attributeValues,
    this.salePrice = 0.0,
    this.stock = 0,
  });

  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  toJson() {
    return {
      'id': id,
      'image': image,
      'description': description,
      'price': price,
      'attribute': attributeValues,
      'salePrice': salePrice,
      'stock': stock,
    };
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductVariationModel.fromJson(document);
    return ProductVariationModel(
      id: data['id'] ?? "",
      price: data['price'] ?? "",
      sku: data['sku'] ?? "",
      stock: data['stock'] ?? "",
      salePrice: data["salePrice"] ?? "",
      image: data['image'] ?? "",
      description: data['description'] ?? "",
      attributeValues: Map<String, String>.from(data['attribute']),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    price,
    sku,
    stock,
    salePrice,
    image,
    attributeValues,
    description,
  ];
}
