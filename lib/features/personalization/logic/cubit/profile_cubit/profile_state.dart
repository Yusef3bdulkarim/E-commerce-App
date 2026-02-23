part of 'profile_cubit.dart';

// @immutable
//  class ProfileState extends Equatable {
//   @override
//   List<Object?> get props => [];
//
// }
//
// class ProfileInitial extends ProfileState {}
//
// class ProfileLoading extends ProfileState {}
// class ProfilePicked extends ProfileState {
//   final File imageFile;
//   ProfilePicked(this.imageFile);
//
//   @override
//   List<Object?> get props => [imageFile];
// }
//
// class ProfileUploading extends ProfileState {}
//
// class ProfileUploaded extends ProfileState {
//   final String imageUrl;
//   ProfileUploaded(this.imageUrl);
//
//   @override
//   List<Object?> get props => [imageUrl];
// }
//
//
// class ProfileSuccess extends ProfileState {
//   final UserModel user;
//
//   ProfileSuccess(this.user);
// }
//
// class ProfileError extends ProfileState {
//   final String message;
//
//   ProfileError(this.message);
// }

enum RequestStatus { initial, loading, success, error }

class ProfileState extends Equatable {
  final RequestStatus getUserStatus;
  final RequestStatus uploadStatus;
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
  });

  ProfileState copyWith({
    RequestStatus? getUserStatus,
    RequestStatus? uploadStatus,
    UserModel? user,
    File? imageFile,
    String? imageUrl,
    String? message,
  }) {
    return ProfileState(
      getUserStatus: getUserStatus ?? this.getUserStatus,
      uploadStatus: uploadStatus ?? this.uploadStatus,
      user: user ?? this.user,
      imageFile: imageFile ?? this.imageFile,
      imageUrl: imageUrl ?? this.imageUrl,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
    getUserStatus,
    uploadStatus,
    user,
    imageFile,
    imageUrl,
    message,
  ];
}
