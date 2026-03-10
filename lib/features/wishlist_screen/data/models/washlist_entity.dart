import 'package:cloud_firestore/cloud_firestore.dart';

class WashlistEntity {
  final String productId;

  WashlistEntity({required this.productId});

  factory WashlistEntity.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return WashlistEntity(productId: doc.id);
  }

}
