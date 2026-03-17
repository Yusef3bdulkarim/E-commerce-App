part of 'profile_cubit.dart';

enum RequestStatus { initial, loading, success, error }

class ProfileState extends Equatable {
  final RequestStatus getUserStatus;
  final RequestStatus uploadStatus;
  final RequestStatus deleteStatus;
  final UserModel? user;
  final File? imageFile;
  final String? imageUrl;
  final String? message;

  const ProfileState({
    this.getUserStatus = RequestStatus.initial,
    this.uploadStatus = RequestStatus.initial,
    this.user,
    this.imageFile,
    this.imageUrl,
    this.message,
    this.deleteStatus = RequestStatus.initial,
  });

  ProfileState copyWith({
    RequestStatus? getUserStatus,
    RequestStatus? uploadStatus,
    RequestStatus? deleteStatus,
    UserModel? user,
    File? imageFile,
    String? imageUrl,
    String? message,
  }) {
    return ProfileState(
      getUserStatus: getUserStatus ?? this.getUserStatus,
      uploadStatus: uploadStatus ?? this.uploadStatus,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      user: user ?? this.user,
      imageFile: imageFile ?? this.imageFile,
      imageUrl: imageUrl ?? this.imageUrl,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
    getUserStatus,
    deleteStatus,
    uploadStatus,
    user,
    imageFile,
    imageUrl,
    message,
  ];
}
