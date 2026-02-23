import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/core/utils/helpers/shared_prefrence.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/service_git_it/service_locator.dart';
import '../../../data/repo/auth_repo.dart';

part 'login_password_state.dart';

class LoginPasswordCubit extends Cubit<LoginPasswordState> {
  final AuthRepo authRepo = getIt<AuthRepo>();

  LoginPasswordCubit() : super(LoginInitial());

  void toggleRememberMe(bool? value) {
    emit(state.copyWith(isRememberMeChecked: value ?? false));
  }

  void togglePassword() {
    emit(state.copyWith(isShowPassword: !state.isShowPassword));
  }

  Future<void> login({required String email, required String pass}) async {
    emit(LoginLoading()); // هنا الـ Listener هيفتح الديالوج

    try {
      final userCredential = await authRepo.signIn(email, pass);

      if (userCredential.user != null && !userCredential.user!.emailVerified) {
        emit(LoginFailure("Please verify your email before logging in."));
        return;
      }

      // حفظ البيانات في الشيرد بريفرنس
      if (state.isRememberMeChecked) {
        TSharedPreferences.saveData("email", email);
        TSharedPreferences.saveData("isRememberMeChecked", true);
      } else {
        TSharedPreferences.removeData("email");
        TSharedPreferences.saveData("isRememberMeChecked", false);
      }

      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    try {
      final userCredential = await authRepo.signInWithGoogle();

      if (userCredential.user != null) {
        emit(LoginSuccess());
      } else {
        emit(LoginInitial());
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
