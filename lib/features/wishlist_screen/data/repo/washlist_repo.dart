import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/core/service_git_it/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WashlistRepo {
  final fireStore = getIt<FirebaseFirestore>();
  final auth = getIt<FirebaseAuth>();

  String get _uid => auth.currentUser!.uid;

  CollectionReference get _wishlistRef =>
      fireStore.collection("Users").doc(_uid).collection('washlist');

  Future<void> toggleWishlist(String productId) async {
    final docRef = _wishlistRef.doc(productId);
    final doc = await docRef.get();

    if (doc.exists) {
      await docRef.delete();
    } else {
      await docRef.set({
        "productId": productId,
        "createdAt": FieldValue.serverTimestamp(),
      });
    }
  }

  Future<void> removeFromWishlist(String productId) async {
    await _wishlistRef.doc(productId).delete();
  }

  Stream<QuerySnapshot> getWishlistStream() {
    return _wishlistRef.snapshots();
  }
}
