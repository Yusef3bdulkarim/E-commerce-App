import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/core/service_git_it/service_locator.dart';
import 'package:ecommerceapp/core/utils/helpers/shared_prefrence.dart';
import 'package:ecommerceapp/features/authentication/data/repo/auth_repo.dart';
import 'package:ecommerceapp/features/personalization/data/repo/profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../Cloudinary_Repository/cloudinary_repo.dart';
import '../../../../authentication/data/models/auth_model.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _repo = getIt<ProfileRepo>();
  final AuthRepo authRepo = getIt<AuthRepo>();

  ProfileCubit() : super(ProfileState());

  Future<void> getUserDetails({bool fromCache = true}) async {
    // أول محاولة للقراءة من SharedPreferences
    if (fromCache) {
      final cachedName = TSharedPreferences.getData('user_name') as String?;
      final cachedEmail = TSharedPreferences.getData('user_email') as String?;
      final cachedPhone = TSharedPreferences.getData('user_phone') as String?;
      final cachedUserName = TSharedPreferences.getData('user_username') as String?;

      if (cachedName != null || cachedEmail != null) {
        final cachedUser = UserModel(
          id: '',
          firstName: cachedName?.split(' ').first ?? '',
          lastName: cachedName?.split(' ').last ?? '',
          userName: cachedUserName ?? '',
          email: cachedEmail ?? '',
          phoneNumber: cachedPhone ?? '',
          imageName: '', // الصورة هنا فاضية لأنها هتيجي من Firebase مباشرة
        );
        emit(state.copyWith(user: cachedUser));
      }
    }

    emit(state.copyWith(getUserStatus: RequestStatus.loading));
    try {
      final user = await authRepo.fetchUserDetails();
      emit(state.copyWith(getUserStatus: RequestStatus.success, user: user));

      // حفظ البيانات محليًا بدون الصورة
      await TSharedPreferences.saveData('user_name', "${user.firstName} ${user.lastName}");
      await TSharedPreferences.saveData('user_email', user.email);
      await TSharedPreferences.saveData('user_phone', user.phoneNumber);
      await TSharedPreferences.saveData('user_username', user.userName);
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
    final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (image == null) return;

    emit(state.copyWith(imageFile: File(image.path), uploadStatus: RequestStatus.loading));

    try {
      final imageUrl = await _repo.uploadProfileImage(File(image.path));
      emit(
        state.copyWith(
          uploadStatus: RequestStatus.success,
          imageUrl: imageUrl,
          imageFile: null,
          user: state.user?.copyWith(imageName: imageUrl),
        ),
      );
    } catch (e) {
      emit(state.copyWith(uploadStatus: RequestStatus.error, imageFile: null, message: e.toString()));
    }
  }

  Future<void> deleteAccount({required String email, required String? password, required bool isGoogle}) async {
    try {
      emit(state.copyWith(deleteStatus: RequestStatus.loading));
      await _repo.deleteAccount(email: email, password: password, isGoogle: isGoogle);
      await TSharedPreferences.clearAll();
      emit(state.copyWith(deleteStatus: RequestStatus.success));
    } catch (e) {
      emit(state.copyWith(deleteStatus: RequestStatus.error, message: e.toString()));
    }
  }

  Future<void> signOut() async {
    await authRepo.signOut();
    await TSharedPreferences.clearAll();
  }
}