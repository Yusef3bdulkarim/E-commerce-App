import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class BannerModel extends Equatable {
  final String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  Map<String, dynamic> toJson() {
    return {'image': imageUrl, 'target': targetScreen, 'active': active};
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
      imageUrl: data['image'] ?? "",
      targetScreen: data['target'] ?? "",
      active: data['active'] ?? false,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [imageUrl, targetScreen, active];
}
