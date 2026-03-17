import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String imageName;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    this.imageName = '',
  });

  String get fullName => '$firstName $lastName';

  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        userName: data['UserName'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        imageName: data['ImageName'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }

  factory UserModel.fromGoogle(User user) {
    List<String> nameParts = user.displayName?.split(" ") ?? ["", ""];
    String fName = nameParts[0];
    String lName = nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "";

    return UserModel(
      id: user.uid,
      firstName: fName,
      lastName: lName,
      userName: generateUserName(user.displayName ?? ""),
      email: user.email ?? "",
      phoneNumber: user.phoneNumber ?? "",
      imageName: user.photoURL ?? "",
    );
  }


  static String generateUserName(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    return "cwt_$firstName$lastName";
  }

  static UserModel empty() => UserModel(
    id: '',
    firstName: '',
    lastName: '',
    userName: '',
    email: '',
    phoneNumber: '',
    imageName: '',
  );

  Map<String, dynamic> toJson() => {
    'FirstName': firstName,
    'LastName': lastName,
    'UserName': userName,
    'Email': email,
    'PhoneNumber': phoneNumber,
    'ImageName': imageName,
  };

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? imageName,
  }) {
    return UserModel(
      id: id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: userName,
      email: email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      imageName: imageName ?? this.imageName,
    );
  }
}
