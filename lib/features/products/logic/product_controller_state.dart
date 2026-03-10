part of 'product_controller_cubit.dart';

enum ProductStatus { initial, loading, loaded, error }

@immutable
class ProductControllerState extends Equatable {
  final ProductStatus status;
  final String selectSize;
  final String? message;
  final Map<String, List<ProductModel>> subCategoryProducts;
  final List<ProductModel> product;
  final List<ProductModel> featuredProducts;
  final String selectedProductImage;
  final String currentSortOption;
  final ProductVariationModel? selectedVariation;
  final Map<String, dynamic> selectedAttributes;

  ProductControllerState({
    this.status = ProductStatus.initial,
    this.subCategoryProducts = const {},
    this.product = const [],
    this.message,
    this.selectedProductImage = '',
    this.selectedVariation,
    this.selectedAttributes = const {},
    this.selectSize = '',
    this.currentSortOption = 'Name',
    this.featuredProducts = const [],
  });

  ProductControllerState copyWith({
    ProductStatus? status,
    Map<String, List<ProductModel>>? subCategoryProducts,
    List<ProductModel>? product,
    List<ProductModel>? featuredProducts,
    String? message,
    String? selectedProductImage,
    ProductVariationModel? selectedVariation,
    Map<String, dynamic>? selectedAttributes,
    String? currentSortOption,
    String? selectSize,
  }) {
    return ProductControllerState(
      selectSize: selectSize ?? this.selectSize,
      status: status ?? this.status,
      product: product ?? this.product,
      featuredProducts: featuredProducts ?? this.featuredProducts,
      subCategoryProducts: subCategoryProducts ?? this.subCategoryProducts,
      message: message ?? this.message,
      selectedProductImage: selectedProductImage ?? this.selectedProductImage,
      selectedVariation: selectedVariation ?? this.selectedVariation,
      selectedAttributes: selectedAttributes ?? this.selectedAttributes,
      currentSortOption: currentSortOption ?? this.currentSortOption,
    );
  }

  @override
  List<Object?> get props => [
    status,
    subCategoryProducts,
    message,
    selectedProductImage,
    product,
    selectedVariation,
    selectedAttributes,
    featuredProducts,
    selectSize,
    currentSortOption,
  ];
}
