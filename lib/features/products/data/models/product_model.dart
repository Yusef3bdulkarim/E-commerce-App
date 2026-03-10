import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/features/products/data/models/brand_models.dart';
import 'package:ecommerceapp/features/products/data/models/product_attribute_model.dart';
import 'package:ecommerceapp/features/products/data/models/product_variation_model.dart';
import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final int stock;
  final String? sku;
  final String? thumbnail;
  final bool? isFeature;
  final BrandModels? brand;
  final List<String>? images;
  final String productType;
  final List<ProductAttributeModel>? productAttributes;
  final List<ProductVariationModel>? productVariations;
  final String? name;
  final double price;
  final double rating;
  final int share;
  final int discount;
  final String? description;
  final String? categoryId;
final String? title;
  final DateTime? updatedAt;
  final DateTime? createdAt;

  ProductModel({
    required this.id,
    this.name,
    this.title,
    required this.stock,
    required this.price,
    required this.description,
    this.categoryId,
    this.updatedAt,
    this.createdAt,
    this.rating = 2.4,
    this.share = 15,
    this.discount = 0,
    this.sku,
    this.thumbnail,
    this.isFeature,
    this.brand,
    this.images,
    required this.productType,
    this.productAttributes,
    this.productVariations,
  });

  factory ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    if (snapshot.data() == null) return ProductModel.empty();
    final data = snapshot.data() as Map<String, dynamic>;

    return ProductModel(
      id: snapshot.id,
      // استخدمنا tryParse و toString عشان نضمن إن الأرقام ما تضربش
      price: double.tryParse((data['price'] ?? 0.0).toString()) ?? 0.0,
      stock: int.tryParse((data['stock'] ?? 0).toString()) ?? 0,
      name: data['name'] ?? data['title'] ?? '', // جرب يقرأ name ولو مفيش يقرأ title
      title: data['title'] ?? data['name'] ?? '',
      productType: data['productType'] ?? 'ProductType.single',
      description: data['description'] ?? '',
      categoryId: data['categoryId'] ?? '',
      thumbnail: data['thumbnail'] ?? '',
      sku: data['sku'] ?? '',
      isFeature: data['isFeature'] ?? false,
      rating: double.tryParse((data['rating'] ?? 0.0).toString()) ?? 2.4,
      share: int.tryParse((data['share'] ?? 0).toString()) ?? 0,
      discount: int.tryParse((data['discount'] ?? 0).toString()) ?? 0,

      images: data['images'] != null ? List<String>.from(data['images']) : [],

      brand: data['brand'] != null ? BrandModels.fromJson(data['brand']) : null,

      productAttributes: data['productAttributes'] != null
          ? (data['productAttributes'] as List).map((e) => ProductAttributeModel.fromJson(e)).toList()
          : [],
      productVariations: data['productVariations'] != null
          ? (data['productVariations'] as List).map((e) => ProductVariationModel.fromJson(e)).toList()
          : [],

      updatedAt: data['updatedAt'] != null ? (data['updatedAt'] as Timestamp).toDate() : DateTime.now(),      createdAt: data['createdAt'] is Timestamp ? (data['createdAt'] as Timestamp).toDate() : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'stock': stock,
      'price': price,
      'sku': sku,
      'title':title,
      'productType': productType,
      'description': description,
      'categoryId': categoryId,
      // 'subCategoryId': subCategoryId,
      // 'imageAsset': imageAsset,
      'thumbnail': thumbnail,
      'isFeature': isFeature,
      'brand': brand?.toJson(),
      'images': images ?? [],
      'productAttributes': productAttributes?.map((e) => e.toJson()).toList(),
      'productVariations': productVariations?.map((e) => e.toJson()).toList(),
      'rating': rating,
      'share': share,
      'discount': discount,
      'updatedAt': updatedAt ?? FieldValue.serverTimestamp(),
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
    };
  }

  factory ProductModel.empty() {
    return ProductModel(
      id: '',
      name: 'Product Not Found',
      price: 0,
      description: '',
      categoryId: '',
      title: '',
      // imageAsset: '',
      // subCategoryId: '',
      stock: 0,
      productType: '',
    );
  }

  @override
  List<Object?> get props => [id, name,title, price, stock, sku, productType, images, brand];
}