import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/core/service_git_it/service_locator.dart';
import 'package:ecommerceapp/features/authentication/data/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final authRepo = getIt<AuthRepo>();

  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  Future<void> resetPassword(String email) async {
    emit(ForgetPasswordLoading());
    try {
      await authRepo.sendPasswordResetEmail(email);
      emit(ForgetPasswordSuccess());
    } catch (e) {
      emit(ForgetPasswordFailure(e.toString()));
    }
  }
}
