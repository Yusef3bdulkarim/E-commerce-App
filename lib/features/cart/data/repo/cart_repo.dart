import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/core/service_git_it/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartRepo {
  final firestore = getIt<FirebaseFirestore>();
  final auth = getIt<FirebaseAuth>();

  String get _uid => auth.currentUser!.uid;

  CollectionReference get _cartRef =>
      firestore.collection('Users').doc(_uid).collection('cart');

  Future<void> addToCart(String productId, int quantity) async {
    final doc = await _cartRef.doc(productId).get();
    if (doc.exists) {
      await _cartRef.doc(productId).update({
        'quantity': FieldValue.increment(quantity),
      });
    } else {
      await _cartRef.doc(productId).set({
        'quantity': quantity,
        'addedAt': FieldValue.serverTimestamp(),
      });
    }
  }

  Future<void> removeFromCart(String productId) async {
    await _cartRef.doc(productId).delete();
  }

  Future<void> updateQuantity(String productId, int quantity) async {
    if (quantity <= 0) {
      await removeFromCart(productId);
    } else {
      await _cartRef.doc(productId).update({'quantity': quantity});
    }
  }

  Stream<QuerySnapshot> getCartStream() {
    return _cartRef.snapshots();
  }
}
