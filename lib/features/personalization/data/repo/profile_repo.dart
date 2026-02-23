import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerceapp/core/service_git_it/service_locator.dart';

import '../../../../core/utils/helpers/shared_prefrence.dart';
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
      await _db.collection('Users').doc(userId).set({
        'ImageName': imageUrl,
      }, SetOptions(merge: true));

      return imageUrl;
    } catch (e) {
      throw 'Failed to upload profile image: $e';
    }
  }

  Future<void> deleteAccount({
    required String email,
    required String? password,
    required bool isGoogle,
  }) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception("No user logged in");
    }
    if (isGoogle) {
      throw Exception("Google re-auth not implemented yet");
    } else {
      if (password == null) {
        throw Exception("Password required");
      }

      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      await user.reauthenticateWithCredential(credential);
    }
    await _db.collection('users').doc(user.uid).delete();
    await user.delete();
  }

  Future<void> saveUserToLocal(UserModel user) async {
    await TSharedPreferences.saveData('user_id', user.id);
    await TSharedPreferences.saveData('user_email', user.email);
    await TSharedPreferences.saveData('user_firstName', user.firstName);
    await TSharedPreferences.saveData('user_lastName', user.lastName);
    await TSharedPreferences.saveData('user_userName', user.userName);
    await TSharedPreferences.saveData('user_phoneNumbers', user.phoneNumber);
  }

  UserModel? getUserFromLocal() {
    final id = TSharedPreferences.getData('user_id');
    final email = TSharedPreferences.getData('user_email');
    final firstName = TSharedPreferences.getData('user_firstName');
    final lastName = TSharedPreferences.getData('user_lastName');
    final userName = TSharedPreferences.getData('user_userName');
    final phoneNumber = TSharedPreferences.getData('user_phoneNumber');

    if (id != null &&
            email != null &&
            firstName != null &&
            lastName != null &&
            userName != null ||
        phoneNumber != null) {
      return UserModel(
        id: id,
        email: email,
        firstName: firstName,
        lastName: lastName,
        userName: userName,
        phoneNumber: phoneNumber,
      );
    }
    return null;
  }

  Future<void> clearLocalUser() async {
    await TSharedPreferences.removeData('user_id');
    await TSharedPreferences.removeData('user_email');
    await TSharedPreferences.removeData('user_firstName');
    await TSharedPreferences.removeData('user_lastName');
    await TSharedPreferences.removeData('user_userName');
    await TSharedPreferences.removeData('user_phoneNumber');
  }
}
