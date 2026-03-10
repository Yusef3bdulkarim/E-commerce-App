import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/core/service_git_it/service_locator.dart';
import 'package:ecommerceapp/features/products/data/models/product_model.dart';
import 'package:ecommerceapp/features/products/data/repo/product_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../core/utils/constants/enums.dart';
import '../data/models/product_variation_model.dart';

part 'product_controller_state.dart';

class ProductControllerCubit extends Cubit<ProductControllerState> {
  final repo = getIt<ProductRepo>();
  StreamSubscription? _streamSubscription;

  ProductControllerCubit() : super(ProductControllerState());

  /////////////////////////
  String getProductPrice(ProductModel product) {
    if (product.productType == ProductType.single.toString()) {
      return (product.discount > 0
              ? product.price - (product.price * product.discount / 100)
              : product.price)
          .toString();
    } else {
      double smallestPrice = double.infinity;
      double largestPrice = 0.0;
      if (product.productVariations == null ||
          product.productVariations!.isEmpty) {
        return product.price.toString();
      }
      for (var variation in product.productVariations!) {
        double priceToConsider = variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price;
        if (priceToConsider < smallestPrice) smallestPrice = priceToConsider;
        if (priceToConsider > largestPrice) largestPrice = priceToConsider;
      }
      if (smallestPrice == largestPrice) {
        return largestPrice.toString();
      } else {
        return '$smallestPrice - $largestPrice';
      }
    }
  }

  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? "In Stock" : "Out of Stock";
  }

  /////////////////////////////////////

  Future<void> fetchFeatureProduct() async {
    emit(state.copyWith(status: ProductStatus.loading));
    try {
      final products = await repo.getProductsByQuery(
        getIt<FirebaseFirestore>().collection('products').limit(6),
      );
      emit(
        state.copyWith(
          status: ProductStatus.loaded,
          featuredProducts: products,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: ProductStatus.error, message: e.toString()));
    }
  }

  Future<void> fetchAllProduct() async {
    emit(state.copyWith(status: ProductStatus.loading));
    try {
      final products = await repo.getProductsByQuery(
        getIt<FirebaseFirestore>().collection('products'),
      );
      emit(state.copyWith(status: ProductStatus.loaded, product: products));
    } catch (e) {
      emit(state.copyWith(status: ProductStatus.error, message: e.toString()));
    }
  }

  Future<void> fetchCategoryProducts(String categoryId) async {
    try {
      emit(state.copyWith(status: ProductStatus.loading));
      final products = await repo.getProductsForCategory(
        categoryId: categoryId,
      );
      emit(state.copyWith(status: ProductStatus.loaded, product: products));
    } catch (e) {
      emit(state.copyWith(status: ProductStatus.error, message: e.toString()));
    }
  }

  Future<void> fetchProductsForCategory(String categoryId) async {
    emit(state.copyWith(status: ProductStatus.loading));
    try {
      final products = await repo.getProductsForCategory(
        categoryId: categoryId,
      );
      emit(state.copyWith(status: ProductStatus.loaded, product: products));
    } catch (e) {
      emit(state.copyWith(status: ProductStatus.error, message: e.toString()));
    }
  }

  Future<void> fetchProductsForSubCategory(String subCategoryId) async {
    emit(state.copyWith(status: ProductStatus.loading));
    try {
      if (state.subCategoryProducts.containsKey(subCategoryId)) {
        return;
      }
      final products = await repo.getProductBySubCategory(
        subCategoryId: subCategoryId,
      );
      final updateProducts = Map<String, List<ProductModel>>.from(
        state.subCategoryProducts,
      );
      updateProducts[subCategoryId] = products;
      emit(
        state.copyWith(
          status: ProductStatus.loaded,
          subCategoryProducts: updateProducts,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: ProductStatus.error, message: e.toString()));
    }
  }

  ///////////////////////////////////////////////////////////

  List<String> getAllProductImages(ProductModel product) {
    Set<String> images = {};
    if (product.thumbnail != null && product.thumbnail!.isNotEmpty) {
      images.add(product.thumbnail!);
    }

    if (product.images != null && product.images!.isNotEmpty) {
      images.addAll(product.images!);
    }

    if (product.productVariations != null) {
      images.addAll(
        product.productVariations!
            .map((v) => v.image)
            .where((img) => img.isNotEmpty),
      );
    }

    return images.toList();
  }

  void updateSelectedImage(String image) {
    emit(state.copyWith(selectedProductImage: image));
  }

  void updateAttributeSelection(
    ProductModel product,
    String attributeName,
    dynamic attributeValue,
  ) {
    final updatedAttributes = Map<String, dynamic>.from(
      state.selectedAttributes,
    );
    updatedAttributes[attributeName] = attributeValue;

    emit(state.copyWith(selectedAttributes: updatedAttributes));

    if (product.productVariations != null) {
      final selectedVariation = product.productVariations!.firstWhere(
        (variation) =>
            _isVariationMatch(variation.attributeValues, updatedAttributes),
        orElse: () => ProductVariationModel.empty(),
      );

      if (selectedVariation.id.isNotEmpty) {
        emit(
          state.copyWith(
            selectedVariation: selectedVariation,
            selectedProductImage: selectedVariation.image.isNotEmpty
                ? selectedVariation.image
                : state.selectedProductImage,
          ),
        );
      }
    }
  }

  bool _isVariationMatch(
    Map<String, String> variationAttributes,
    Map<String, dynamic> selectedAttributes,
  ) {
    if (variationAttributes.length != selectedAttributes.length) return false;
    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  void sortProducts(String sortOption) {
    List<ProductModel> productsToSort = List.from(state.product);
    switch (sortOption) {
      case 'Name':
        productsToSort.sort(
          (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()),
        );
        break;
      case 'Newest':
        productsToSort.sort(
          (a, b) => (a.createdAt ?? DateTime.now()).compareTo(
            b.createdAt ?? DateTime.now(),
          ),
        );

        break;
      case 'Best Seller':
        productsToSort.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'Sale':
        productsToSort.sort((a, b) => b.discount.compareTo(a.discount));
        break;
      default:
        productsToSort.sort(
          (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()),
        );
    }
    emit(state.copyWith(product: productsToSort, status: ProductStatus.loaded));
  }

  void updateSortOption(String option) {
    emit(state.copyWith(currentSortOption: option));
  }
}
