import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/core/service_git_it/service_locator.dart';
import 'package:ecommerceapp/features/authentication/data/repo/auth_repo.dart';
import 'package:ecommerceapp/features/personalization/data/repo/profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../../Cloudinary_Repository/cloudinary_repo.dart';
import '../../../../authentication/data/models/auth_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _repo = getIt<ProfileRepo>();
  final authRepo = getIt<AuthRepo>();

  ProfileCubit() : super(ProfileState());

  Future<void> getUserDetails() async {
    emit(state.copyWith(getUserStatus: RequestStatus.loading));
    try {
      final user = await authRepo.fetchUserDetails();
      emit(state.copyWith(getUserStatus: RequestStatus.success, user: user));
    } catch (e) {
      emit(
        state.copyWith(
          getUserStatus: RequestStatus.error,
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> pickAndUploadImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image == null) return;

    emit(state.copyWith(
      imageFile: File(image.path),
      uploadStatus: RequestStatus.loading,
    ));

    try {
      final imageUrl = await _repo.uploadProfileImage(File(image.path));

      emit(state.copyWith(
        uploadStatus: RequestStatus.success,
        imageUrl: imageUrl,
        imageFile: null,
        user: state.user?.copyWith(imageName: imageUrl),
      ));
      print("Uploaded image URL: $imageUrl");
    } catch (e) {
      emit(state.copyWith(
        uploadStatus: RequestStatus.error,
        imageFile: null,
        message: e.toString(),
      ));
      print("Upload error: $e");
    }
  }
}
