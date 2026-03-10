import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/core/service_git_it/service_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderRepository {
  final _firestore = getIt<FirebaseFirestore>();
  final _auth = getIt<FirebaseAuth>();

  String get _uid => _auth.currentUser!.uid;

  Future<void> createOrder({
    required List<Map<String, dynamic>> items,
    required double subTotal,
    required double shipping,
    required double tax,
    required double total,
  }) async {
    final orderRef = _firestore
        .collection('users')
        .doc(_uid)
        .collection('orders')
        .doc();

    await orderRef.set({
      'items': items,
      'subTotal': subTotal,
      'shipping': shipping,
      'tax': tax,
      'total': total,
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
    });

    // تفريغ السلة بعد نجاح الطلب
    final cartRef = _firestore.collection('users').doc(_uid).collection('cart');

    final cartItems = await cartRef.get();

    for (var doc in cartItems.docs) {
      await doc.reference.delete();
    }
  }
}
