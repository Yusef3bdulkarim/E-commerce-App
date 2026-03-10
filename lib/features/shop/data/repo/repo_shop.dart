import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/core/service_git_it/service_locator.dart';
import 'package:ecommerceapp/core/utils/exceptions/exports.dart';
import 'package:ecommerceapp/features/shop/data/models/Category/model_category.dart';
import 'package:ecommerceapp/features/shop/data/models/banner_model/banner_model.dart';
import 'package:flutter/services.dart';

class RepoShop {
  final FirebaseFirestore _db = getIt<FirebaseFirestore>();

  Future<List<ModelCategory>> getAllCategories() async {
    try {
      final snapshot = await _db
          .collection('Categories')
          .where('parentId', isEqualTo: "")
          .get();
      return snapshot.docs.map((e) => ModelCategory.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

  Future<List<ModelCategory>> getSubCategories(String parentId) async {
    try {
      final snapshot = await _db
          .collection('Categories')
          .where('parentId', isEqualTo: parentId)
          .get();
      return snapshot.docs.map((e) => ModelCategory.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

  Stream<List<ModelCategory>> getAllCategoriesStream() {
    try {
      return _db
          .collection('Categories')
          .where('parentId', isEqualTo: "")
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map((doc) => ModelCategory.fromSnapshot(doc))
                .toList(),
          );
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }

  Stream<List<BannerModel>> getAllBannerStream() {
    try {
      return _db
          .collection("Banner")
          .where('active', isEqualTo: true)
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map((doc) => BannerModel.fromSnapshot(doc))
                .toList(),
          );
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again';
    }
  }
}
