import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/core/service_git_it/service_locator.dart';
import 'package:ecommerceapp/core/utils/exceptions/exports.dart';
import 'package:ecommerceapp/features/authentication/data/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  final _firebaseAuth = getIt<FirebaseAuth>();
  final FirebaseFirestore _db = getIt<FirebaseFirestore>();
  final _googleSignIn = getIt<GoogleSignIn>();

  // الحصول على المستخدم الحالي (Auth فقط)
  User? getCurrentUser() => _firebaseAuth.currentUser;

  // مراقبة حالة تسجيل الدخول
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  /////////////// Sign In (Email & Password)
  Future<UserCredential> signIn(String email, String password) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  /////////////// Sign In With Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) {
        throw Exception("Google sign in aborted");
      }

      final GoogleSignInAuthentication auth = await account.authentication;
      final credential = GoogleAuthProvider.credential(
          idToken: auth.idToken,
          accessToken: auth.accessToken
      );
      final userCredential = await _firebaseAuth.signInWithCredential(credential);
      if (userCredential.user != null) {
        await saveUserRecord(userCredential.user!);
      }

      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  /////////////// Sign Up
  Future<UserCredential> registerUser(String email, String pass) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      if (userCredential.user != null) {
        await saveUserRecord(userCredential.user!);
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  /////////////// Sign out
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _firebaseAuth.signOut();
    } catch (e) {
      throw 'Error signing out: $e';
    }
  }

  //////////////// Forget Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw e.toString();
    }
  }

  //////////////// Save User Data to Firestore
  Future<void> saveUserRecord(User user) async {
    try {
      final userDoc = await _db.collection("Users").doc(user.uid).get();

      // بنسيف البيانات فقط لو المستخدم مش موجود قبل كده (أول مرة تسجيل)
      if (!userDoc.exists) {
        final userModel = UserModel.fromGoogle(user);
        await _db.collection("Users").doc(user.uid).set(userModel.toJson());
      }
    } catch (e) {
      throw 'Error saving user record: $e';
    }
  }

  //////////////// Verification Email
  Future<void> sendEmailVerification() async {
    try {
      await _firebaseAuth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //////////////// Get Full User Details from Firestore
  Future<UserModel> fetchUserDetails() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        final documentSnapshot = await _db.collection("Users").doc(user.uid).get();
        if (documentSnapshot.exists) {
          return UserModel.fromSnapshot(documentSnapshot);
        }
      }
      return UserModel.empty();
    } catch (e) {
      throw 'Error fetching user details: $e';
    }
  }
  //////////////////

}