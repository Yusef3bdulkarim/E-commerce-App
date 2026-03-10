import 'package:cloud_firestore/cloud_firestore.dart';

class CartEntity {
  final String productId;
  final int quantity;

  CartEntity({required this.productId, required this.quantity});

  factory CartEntity.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CartEntity(productId: doc.id, quantity: data['quantity'] ?? 1);
  }

  Map<String, dynamic> toJson() {
    return {'quantity': quantity, 'addedAt': FieldValue.serverTimestamp()};

  }
}
