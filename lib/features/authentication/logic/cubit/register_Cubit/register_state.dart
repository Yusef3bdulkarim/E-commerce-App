part of 'register_cubit.dart';

@immutable
class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}
class RegisterFailure extends RegisterState {
  final String errorMessage;

  RegisterFailure(this.errorMessage);
}

class CheckBoxPrivacyPolicy extends RegisterState {
  final bool showBoxPrivacyPolicy;

  CheckBoxPrivacyPolicy({required this.showBoxPrivacyPolicy});

  CheckBoxPrivacyPolicy copyWith({bool? showBoxPrivacyPolicy}) {
    return CheckBoxPrivacyPolicy(
      showBoxPrivacyPolicy: showBoxPrivacyPolicy ?? this.showBoxPrivacyPolicy,
    );
  }
}
class VerifyEmailSuccess extends RegisterState{

}

