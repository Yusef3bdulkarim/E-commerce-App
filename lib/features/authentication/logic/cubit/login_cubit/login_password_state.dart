part of 'login_password_cubit.dart';

@immutable
class LoginPasswordState {
  final bool isShowPassword;
  final bool isRememberMeChecked; // ضفنا دي هنا عشان متضيعش
  final String? errorMessage; // ضفنا دي هنا للسهولة

  LoginPasswordState({
    this.isShowPassword = false,
    this.isRememberMeChecked = false,
    this.errorMessage,
  });

  LoginPasswordState copyWith({
    bool? isShowPassword,
    bool? isRememberMeChecked,
    String? errorMessage,
  }) {
    return LoginPasswordState(
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isRememberMeChecked: isRememberMeChecked ?? this.isRememberMeChecked,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// الحالات الفرعية بقت بسيطة جداً وبتورث كل شيء
final class LoginInitial extends LoginPasswordState {}
final class LoginLoading extends LoginPasswordState {}
final class LoginSuccess extends LoginPasswordState {}
final class LoginFailure extends LoginPasswordState {
  final String error;
  LoginFailure(this.error);
}