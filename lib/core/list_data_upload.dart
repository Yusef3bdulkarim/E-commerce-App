import '../features/products/data/models/brand_models.dart';
import '../features/products/data/models/product_attribute_model.dart';
import '../features/products/data/models/product_model.dart';
import '../features/products/data/models/product_variation_model.dart';
import 'package:ecommerceapp/core/utils/constants/image_strings.dart';

List<ProductModel> dummyProducts = [
  ProductModel(
    id: 'p1',
    title: 'Nike Air Jordan Blue',
    name: 'Nike Air Jordan Blue',
    stock: 15,
    price: 220,
    description: 'Original Nike Air Jordan blue edition.',
    categoryId: 'shoes_airgordin',
    sku: 'AJ100',
    thumbnail: TImages.productImage19,
    images: [
      TImages.productImage19,
      TImages.productImage21,
      TImages.productImage22,
    ],
    brand: BrandModels(id: 'b1', name: 'Nike', image: TImages.nikeLogo),
    productType: 'ProductType.variable',
    discount: 10,
    productAttributes: [
      ProductAttributeModel(name: 'Size', values: ['EU40','EU41','EU42','EU43']),
      ProductAttributeModel(name: 'Color', values: ['Blue','Black']),
    ],
    productVariations: [
      ProductVariationModel(id: 'v1', price: 220, stock: 5, attributeValues: {'Size':'EU40','Color':'Blue'}, image: TImages.productImage19),
      ProductVariationModel(id: 'v2', price: 220, stock: 5, attributeValues: {'Size':'EU41','Color':'Blue'}, image: TImages.productImage19),
      ProductVariationModel(id: 'v3', price: 210, stock: 5, attributeValues: {'Size':'EU42','Color':'Black'}, image: TImages.productImage21),
    ],
  ),

  ProductModel(
    id: 'p2',
    title: 'Nike Air Jordan Orange',
    name: 'Nike Air Jordan Orange',
    stock: 12,
    price: 210,
    description: 'Nike Jordan limited orange.',
    categoryId: 'shoes_airgordin',
    sku: 'AJ101',
    thumbnail: TImages.productImage20,
    images: [
      TImages.productImage20,
      TImages.productImage21,
    ],
    brand: BrandModels(id: 'b1', name: 'Nike', image: TImages.nikeLogo),
    productType: 'ProductType.variable',
    discount: 12,
    productAttributes: [
      ProductAttributeModel(name: 'Size', values: ['EU40','EU41','EU42']),
      ProductAttributeModel(name: 'Color', values: ['Orange']),
    ],
    productVariations: [
      ProductVariationModel(id: 'v1', price: 210, stock: 6, attributeValues: {'Size':'EU40','Color':'Orange'}, image: TImages.productImage20),
      ProductVariationModel(id: 'v2', price: 210, stock: 6, attributeValues: {'Size':'EU41','Color':'Orange'}, image: TImages.productImage20),
    ],
  ),

  ProductModel(
    id: 'p3',
    title: 'Nike Air Max',
    name: 'Nike Air Max',
    stock: 20,
    price: 180,
    description: 'Nike air max running shoe.',
    categoryId: 'sports_shoes',
    sku: 'AX102',
    thumbnail: TImages.productImage21,
    images: [
      TImages.productImage21,
      TImages.productImage22,
    ],
    brand: BrandModels(id: 'b1', name: 'Nike', image: TImages.nikeLogo),
    productType: 'ProductType.variable',
    productAttributes: [
      ProductAttributeModel(name: 'Size', values: ['EU41','EU42','EU43']),
      ProductAttributeModel(name: 'Color', values: ['Black','White']),
    ],
    productVariations: [
      ProductVariationModel(id: 'v1', price: 180, stock: 8, attributeValues: {'Size':'EU41','Color':'Black'}, image: TImages.productImage21),
      ProductVariationModel(id: 'v2', price: 180, stock: 8, attributeValues: {'Size':'EU42','Color':'White'}, image: TImages.productImage22),
    ],
  ),

  ProductModel(
    id: 'p4',
    title: 'Nike Wildhorse',
    name: 'Nike Wildhorse',
    stock: 18,
    price: 190,
    description: 'Trail running shoes.',
    categoryId: 'sports_shoes',
    thumbnail: TImages.productImage23,
    images: [
      TImages.productImage23,
      TImages.productImage21,
    ],
    brand: BrandModels(id: 'b1', name: 'Nike', image: TImages.nikeLogo),
    productType: 'ProductType.single',
  ),

  ProductModel(
    id: 'p5',
    title: 'Samsung Galaxy S9',
    name: 'Samsung Galaxy S9',
    stock: 25,
    price: 520,
    description: 'Samsung Galaxy flagship phone.',
    categoryId: 'mobile_android',
    thumbnail: TImages.productImage11,
    images: [
      TImages.productImage11,
      TImages.productImage12,
      TImages.productImage13,
    ],
    brand: BrandModels(id: 'b2', name: 'Samsung', image: TImages.appleLogo),
    productType: 'ProductType.single',
    discount: 8,
  ),

  ProductModel(
    id: 'p6',
    title: 'iPhone 14',
    name: 'iPhone 14',
    stock: 10,
    price: 1200,
    description: 'Apple iPhone flagship.',
    categoryId: 'mobile_iphone',
    thumbnail: TImages.productiphone1,
    images: [
      TImages.productiphone1,
      TImages.productiphone3,
    ],
    brand: BrandModels(id: 'b3', name: 'Apple', image: TImages.appleLogo),
    productType: 'ProductType.variable',
    productAttributes: [
      ProductAttributeModel(name: 'Storage', values: ['128GB','256GB']),
      ProductAttributeModel(name: 'Color', values: ['Black','Gold']),
    ],
    productVariations: [
      ProductVariationModel(id: 'v1', price: 1200, stock: 5, attributeValues: {'Storage':'128GB','Color':'Black'}, image: TImages.productiphone1),
      ProductVariationModel(id: 'v2', price: 1300, stock: 5, attributeValues: {'Storage':'256GB','Color':'Gold'}, image: TImages.productiphone3),
    ],
  ),

  ProductModel(
    id: 'p7',
    title: 'Luxury Perfume',
    name: 'Luxury Perfume',
    stock: 40,
    price: 90,
    description: 'Premium perfume fragrance.',
    categoryId: 'cosmetics_purfume',
    thumbnail: TImages.productpurfume1,
    images: [
      TImages.productpurfume1,
      TImages.productpurfume2,
      TImages.productpurfume3,
    ],
    brand: BrandModels(id: 'b4', name: 'Zara', image: TImages.zaraLogo),
    productType: 'ProductType.single',
  ),

  ProductModel(
    id: 'p8',
    title: 'Skin Care Cream',
    name: 'Skin Care Cream',
    stock: 35,
    price: 55,
    description: 'Moisturizing skincare cream.',
    categoryId: 'cosmetics_skincare',
    thumbnail: TImages.productskincare1,
    images: [
      TImages.productskincare1,
      TImages.productskincare2,
    ],
    brand: BrandModels(id: 'b4', name: 'Beauty', image: TImages.zaraLogo),
    productType: 'ProductType.single',
  ),

  ProductModel(
    id: 'p9',
    title: 'Red Collar T-Shirt',
    name: 'Red Collar T-Shirt',
    stock: 50,
    price: 35,
    description: 'Comfort cotton t-shirt.',
    categoryId: 'clothes_tshirts',
    thumbnail: TImages.productImage60,
    images: [
      TImages.productImage60,
      TImages.productImage68,
      TImages.productImage69,
    ],
    brand: BrandModels(id: 'b4', name: 'Zara', image: TImages.zaraLogo),
    productType: 'ProductType.variable',
    productAttributes: [
      ProductAttributeModel(name: 'Size', values: ['S','M','L','XL']),
    ],
    productVariations: [
      ProductVariationModel(id: 'v1', price: 35, stock: 10, attributeValues: {'Size':'S'}, image: TImages.productImage60),
      ProductVariationModel(id: 'v2', price: 35, stock: 10, attributeValues: {'Size':'M'}, image: TImages.productImage60),
    ],
  ),

  ProductModel(
    id: 'p10',
    title: 'Leather Jacket',
    name: 'Leather Jacket',
    stock: 15,
    price: 160,
    description: 'Premium leather jacket.',
    categoryId: 'clothes_jacket',
    thumbnail: TImages.productImage64,
    images: [
      TImages.productImage64,
      TImages.productImage65,
      TImages.productImage66,
      TImages.productImage67,
    ],
    brand: BrandModels(id: 'b4', name: 'Zara', image: TImages.zaraLogo),
    productType: 'ProductType.variable',
    productAttributes: [
      ProductAttributeModel(name: 'Size', values: ['M','L','XL']),
    ],
    productVariations: [
      ProductVariationModel(id: 'v1', price: 160, stock: 5, attributeValues: {'Size':'M'}, image: TImages.productImage64),
      ProductVariationModel(id: 'v2', price: 160, stock: 5, attributeValues: {'Size':'L'}, image: TImages.productImage65),
    ],
  ),

  ProductModel(
    id: 'p11',
    title: 'Blue Sport T-Shirt',
    name: 'Blue Sport T-Shirt',
    stock: 45,
    price: 32,
    description: 'Breathable sport training shirt.',
    categoryId: 'sports_tshirts',
    thumbnail: TImages.productImage63,
    images: [
      TImages.productImage63,
      TImages.productImage60,
    ],
    brand: BrandModels(id: 'b1', name: 'Nike', image: TImages.nikeLogo),
    productType: 'ProductType.variable',
    productAttributes: [
      ProductAttributeModel(name: 'Size', values: ['S','M','L','XL']),
    ],
    productVariations: [
      ProductVariationModel(id: 'v1', price: 32, stock: 10, attributeValues: {'Size':'S'}, image: TImages.productImage63),
      ProductVariationModel(id: 'v2', price: 32, stock: 10, attributeValues: {'Size':'M'}, image: TImages.productImage63),
    ],
  ),

  ProductModel(
    id: 'p12',
    title: 'Green Training Shirt',
    name: 'Green Training Shirt',
    stock: 40,
    price: 30,
    description: 'Gym sport t-shirt.',
    categoryId: 'sports_tshirts',
    thumbnail: TImages.productImage62,
    images: [
      TImages.productImage62,
      TImages.productImage60,
    ],
    brand: BrandModels(id: 'b1', name: 'Nike', image: TImages.nikeLogo),
    productType: 'ProductType.variable',
    productAttributes: [
      ProductAttributeModel(name: 'Size', values: ['S','M','L']),
    ],
    productVariations: [
      ProductVariationModel(id: 'v1', price: 30, stock: 10, attributeValues: {'Size':'S'}, image: TImages.productImage62),
      ProductVariationModel(id: 'v2', price: 30, stock: 10, attributeValues: {'Size':'M'}, image: TImages.productImage62),
    ],
  ),

  ProductModel(
    id: 'p13',
    title: 'Running Shoes Pro',
    name: 'Running Shoes Pro',
    stock: 20,
    price: 150,
    description: 'Professional running shoes.',
    categoryId: 'sport',
    thumbnail: TImages.productImage21,
    images: [
      TImages.productImage21,
      TImages.productImage23,
    ],
    brand: BrandModels(id: 'b1', name: 'Nike', image: TImages.nikeLogo),
    productType: 'ProductType.variable',
    productAttributes: [
      ProductAttributeModel(name: 'Size', values: ['EU40','EU41','EU42']),
    ],
    productVariations: [
      ProductVariationModel(id: 'v1', price: 150, stock: 7, attributeValues: {'Size':'EU40'}, image: TImages.productImage21),
      ProductVariationModel(id: 'v2', price: 150, stock: 7, attributeValues: {'Size':'EU41'}, image: TImages.productImage21),
    ],
  ),

  ProductModel(
    id: 'p14',
    title: 'Basketball Elite Shoe',
    name: 'Basketball Elite Shoe',
    stock: 18,
    price: 165,
    description: 'Elite basketball performance shoe.',
    categoryId: 'sports_shoes',
    thumbnail: TImages.productImage22,
    images: [
      TImages.productImage22,
      TImages.productImage21,
    ],
    brand: BrandModels(id: 'b1', name: 'Nike', image: TImages.nikeLogo),
    productType: 'ProductType.single',
  ),

  ProductModel(
    id: 'p15',
    title: 'Luxury Perfume Gold',
    name: 'Luxury Perfume Gold',
    stock: 35,
    price: 95,
    description: 'Elegant luxury perfume.',
    categoryId: 'cosmetics_purfume',
    thumbnail: TImages.productpurfume2,
    images: [
      TImages.productpurfume2,
      TImages.productpurfume3,
    ],
    brand: BrandModels(id: 'b4', name: 'Zara', image: TImages.zaraLogo),
    productType: 'ProductType.single',
    discount: 5,
  ),

  ProductModel(
    id: 'p16',
    title: 'Night Perfume',
    name: 'Night Perfume',
    stock: 30,
    price: 88,
    description: 'Night fragrance perfume.',
    categoryId: 'cosmetics_purfume',
    thumbnail: TImages.productpurfume3,
    images: [
      TImages.productpurfume3,
      TImages.productpurfume1,
    ],
    brand: BrandModels(id: 'b4', name: 'Zara', image: TImages.zaraLogo),
    productType: 'ProductType.single',
  ),

  ProductModel(
    id: 'p17',
    title: 'Skin Care Serum',
    name: 'Skin Care Serum',
    stock: 33,
    price: 60,
    description: 'Daily skincare serum.',
    categoryId: 'cosmetics_skincare',
    thumbnail: TImages.productskincare2,
    images: [
      TImages.productskincare2,
      TImages.productskincare1,
    ],
    brand: BrandModels(id: 'b4', name: 'Beauty', image: TImages.zaraLogo),
    productType: 'ProductType.single',
  ),

  ProductModel(
    id: 'p18',
    title: 'Android Phone Pro',
    name: 'Android Phone Pro',
    stock: 16,
    price: 550,
    description: 'Latest Android smartphone.',
    categoryId: 'mobile_android',
    thumbnail: TImages.productImage12,
    images: [
      TImages.productImage11,
      TImages.productImage12,
      TImages.productImage13,
    ],
    brand: BrandModels(id: 'b2', name: 'Samsung', image: TImages.appleLogo),
    productType: 'ProductType.variable',
    productAttributes: [
      ProductAttributeModel(name: 'Storage', values: ['128GB','256GB']),
    ],
    productVariations: [
      ProductVariationModel(id: 'v1', price: 550, stock: 8, attributeValues: {'Storage':'128GB'}, image: TImages.productImage12),
      ProductVariationModel(id: 'v2', price: 600, stock: 8, attributeValues: {'Storage':'256GB'}, image: TImages.productImage12),
    ],
  ),

  ProductModel(
    id: 'p19',
    title: 'iPhone Premium Gold',
    name: 'iPhone Premium Gold',
    stock: 12,
    price: 1350,
    description: 'Premium gold iPhone.',
    categoryId: 'mobile_iphone',
    thumbnail: TImages.productiphone3,
    images: [
      TImages.productiphone3,
      TImages.productiphone1,
    ],
    brand: BrandModels(id: 'b3', name: 'Apple', image: TImages.appleLogo),
    productType: 'ProductType.single',
  ),

  ProductModel(
    id: 'p20',
    title: 'Classic Cotton Shirt',
    name: 'Classic Cotton Shirt',
    stock: 55,
    price: 28,
    description: 'Comfort everyday cotton shirt.',
    categoryId: 'clothes_tshirts',
    thumbnail: TImages.productImage69,
    images: [
      TImages.productImage69,
      TImages.productImage68,
    ],
    brand: BrandModels(id: 'b4', name: 'Zara', image: TImages.zaraLogo),
    productType: 'ProductType.variable',
    productAttributes: [
      ProductAttributeModel(name: 'Size', values: ['S','M','L','XL']),
    ],
    productVariations: [
      ProductVariationModel(id: 'v1', price: 28, stock: 10, attributeValues: {'Size':'S'}, image: TImages.productImage69),
      ProductVariationModel(id: 'v2', price: 28, stock: 10, attributeValues: {'Size':'M'}, image: TImages.productImage69),
    ],
  ),
];