import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ModelCategory extends Equatable{
  String id;
  String name;
  String image;
  String nameBrand;
  String banner;
  String parentId;
  bool isFeatured;

  ModelCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.banner,
    required this.nameBrand,
    this.parentId = "",
    required this.isFeatured,
  });

  static ModelCategory empty() => ModelCategory(
    id: '',
    name: '',
    banner: '',
    image: '',
    nameBrand: '',
    isFeatured: false,
    parentId: "",
  );

  // 2. تحويل الكائن إلى Map لرفعه إلى Firestore
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      "nameBrand":nameBrand,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured,
      'banner': banner,
    };
  }
  factory ModelCategory.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();
    if (data != null) {
      print("Checking Category: ${data['Name']} | Path: '${data['Image']}'");
      // final data = doc.data()!;
      return ModelCategory(
        id: doc.id,
        nameBrand: data['nameBrand']??"",
        name: data["Name"] ?? "",
        banner: data["banner"] ?? "",
        image: data["Image"] ?? "",
        isFeatured: data["IsFeatured"] ?? false,
        parentId: data["ParentId"] ?? "", // تأكد أن الحروف مطابقة للـ Firestore
      );
    } else {
      return ModelCategory.empty();
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [image,id,name,nameBrand,banner,isFeatured,parentId];
}
