import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/core/service_git_it/service_locator.dart';
import 'package:ecommerceapp/core/utils/exceptions/exports.dart';
import 'package:ecommerceapp/features/products/data/models/product_model.dart';
import 'package:flutter/services.dart';
import '../../../shop/data/models/Category/model_category.dart';

class ProductRepo {
  final FirebaseFirestore _db = getIt<FirebaseFirestore>();

  CollectionReference get _product => _db.collection('products');

  Future<List<ProductModel>> getProductsByQuery(Query query) async {
    try {
      final snapshot = await query.get();
      return snapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

  /////////////////////////////////
  Future<List<ProductModel>> getProductsForCategory({
    required String categoryId,
    int limit = -1,
  }) async {
    try {
      final subCategoriesQuery = await _db
          .collection('Categories')
          .where('parentId', isEqualTo: categoryId)
          .get();

      List<String> categoryIds = [categoryId];
      categoryIds.addAll(subCategoriesQuery.docs.map((doc) => doc.id).toList());
      Query query = _product.where('categoryId', whereIn: categoryIds);
      if (limit > 0) query = query.limit(limit);
      return await getProductsByQuery(query);
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  Future<List<ProductModel>> getProductBySubCategory({
    required String subCategoryId,
    int limit = 10,
  }) async {
    Query query = _product
        .where('categoryId', isEqualTo: subCategoryId)
        .limit(limit);
    return await getProductsByQuery(query);
  }

  ///////////////////////

  Future<void> uploadAllProducts(List<ProductModel> products) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;

    try {
      final WriteBatch batch = db.batch();
      for (var product in products) {
        final docRef = db.collection("products").doc(product.id);
        batch.set(docRef, product.toJson());
      }

      await batch.commit();
    } catch (e) {}
  }
}
