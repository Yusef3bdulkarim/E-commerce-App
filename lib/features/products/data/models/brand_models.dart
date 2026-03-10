import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class BrandModels extends Equatable {
  String id;
  String name;
  String image;
  bool? isFeature;
  int? productsCount;

  BrandModels({
    required this.id,
    required this.image,
    required this.name,
    this.isFeature,
    this.productsCount,
  });

  static BrandModels empty() => BrandModels(id: '', image: '', name: '');

  toJson() {
    return {
      "id": id,
      'name': name,
      'image': image,
      'productcount': productsCount,
      'isFeatured': isFeature,
    };
  }

  factory BrandModels.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModels.empty();
    return BrandModels(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      isFeature: data['isFeature'] ?? false,
      productsCount: data['productcount'] ?? 0,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id,name,image,isFeature,productsCount];
}
