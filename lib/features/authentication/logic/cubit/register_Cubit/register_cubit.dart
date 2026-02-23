import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../../core/service_git_it/service_locator.dart';
import '../../../../../core/utils/network/network_managed_cubit.dart';
import '../../../data/models/auth_model.dart';
import '../../../data/repo/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo authRepo = getIt<AuthRepo>();
  final FirebaseFirestore _db = getIt<FirebaseFirestore>();
  //////////////////
  bool isPrivacyPolicyAccepted = false;
  Timer? _timer;

  RegisterCubit() : super(RegisterInitial());

  void toggleCheckBox() {
    isPrivacyPolicyAccepted = !isPrivacyPolicyAccepted;
    emit(CheckBoxPrivacyPolicy(showBoxPrivacyPolicy: isPrivacyPolicyAccepted));
  }

  Future<void> registerUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String userName,
    required String phoneNumber,
  }) async {
    if (!isPrivacyPolicyAccepted) return;

    emit(RegisterLoading());
    try {
      final isConnected = await getIt<NetworkCubit>().isConnected();
      if (!isConnected) {
        emit(RegisterFailure("No Internet Connection"));
        return;
      }
      final userCredential = await authRepo.registerUser(
        email,
        password,
      );

      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName,
        lastName: lastName,
        userName: userName,
        email: email,
        phoneNumber: phoneNumber,
      );
      await sendEmailVerification();
      await _db.collection("Users").doc(newUser.id).set(newUser.toJson());
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await authRepo.sendEmailVerification();
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }

  void setTimerForAutoRedirect() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        emit(VerifyEmailSuccess());
      }
    });
  }

  Future<void> checkEmailVerificationStatus() async {
    await FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if (user?.emailVerified ?? false) {
      emit(VerifyEmailSuccess());
    }
  }

}
