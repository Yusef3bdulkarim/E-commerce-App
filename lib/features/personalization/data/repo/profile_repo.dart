import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerceapp/core/service_git_it/service_locator.dart';

import '../../../authentication/data/models/auth_model.dart';

class ProfileRepo {
  final FirebaseFirestore _db = getIt<FirebaseFirestore>();
  final FirebaseAuth _auth = getIt<FirebaseAuth>();
  final cloudinary = CloudinaryPublic(
    'dczg71vlx', // حط اسم الكلاود هنا من Dashboard
    'ml_default', // حط الـ preset اللي عاملته للـ unsigned upload
  );

  /// جلب بيانات المستخدم
  Future<UserModel> getUserData() async {
    final userId = _auth.currentUser!.uid;
    final doc = await _db.collection('Users').doc(userId).get();
    return UserModel.fromSnapshot(doc);
  }

  /// رفع الصورة على Cloudinary وتحديث Firestore مباشرة
  Future<String> uploadProfileImage(File file) async {
    try {
      final userId = _auth.currentUser!.uid;

      final response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          file.path,
          resourceType: CloudinaryResourceType.Image,
          folder: 'users/$userId',
        ),
      );

      final imageUrl = response.secureUrl;

      // تحديث Firestore
      await _db.collection('Users').doc(userId).set(
        {'ImageName': imageUrl},
        SetOptions(merge: true),
      );

      return imageUrl;
    } catch (e) {
      throw 'Failed to upload profile image: $e';
    }
  }
}