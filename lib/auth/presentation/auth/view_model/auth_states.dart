import '../../../domain/entity/login_entity.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignInLoading extends AuthState {}

final class SignInSuccess extends AuthState {
  final String? message;

  SignInSuccess(this.message);
}

final class SignInFail extends AuthState {
  final String? errorMassage;

  SignInFail(this.errorMassage);
}




final class SignInWithGoogleLoading extends AuthState {}

final class SignInWithGoogleSuccess extends AuthState {
  final UserEntity user;

  SignInWithGoogleSuccess(this.user);
}

final class SignInWithGoogleFail extends AuthState {
  final String? errorMassage;

  SignInWithGoogleFail(this.errorMassage);
}


final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {
  final String? message;

  SignUpSuccess(this.message);
}

final class SignUpFail extends AuthState {
  final String? errorMassage;

  SignUpFail(this.errorMassage);
}
class ForgotPasswordInitialState extends AuthState {}

class ForgotPasswordErrorState extends AuthState {
  final String? errorMassage;
  ForgotPasswordErrorState({required this.errorMassage});
}

class ForgotPasswordLoadingState extends AuthState {
  final String? loadingMessage;
  ForgotPasswordLoadingState({required this.loadingMessage});
}

class ForgotPasswordSuccessState extends AuthState {
  final String? success;
  ForgotPasswordSuccessState({required this.success});
}

//VerifyEmailCode
class VerifyEmailCodeErrorState extends AuthState {
  final String? errorMassage;
  VerifyEmailCodeErrorState({required this.errorMassage});
}

class VerifyEmailCodeLoadingState extends AuthState {
  final String? loadingMessage;
  VerifyEmailCodeLoadingState({required this.loadingMessage});
}

class VerifyEmailCodeSuccessState extends AuthState {
  final String? success;
  VerifyEmailCodeSuccessState({required this.success});
}

//ResendCode
class ResendLoadingState extends AuthState {
  String? loadingMessage;
  ResendLoadingState({required this.loadingMessage});
}

class ResendSuccessState extends AuthState {
  final String? success;
  ResendSuccessState({required this.success});
}

class ResendErrorState extends AuthState {
  final String? errorMassage;
  ResendErrorState({required this.errorMassage});
}
//ResetPassword
class ResetPasswordLoadingState extends AuthState {
  String? loadingMessage;
  ResetPasswordLoadingState({required this.loadingMessage});
}

class ResetPasswordSuccessState extends AuthState {
  final String? success;
  ResetPasswordSuccessState({required this.success});
}

class ResetPasswordErrorState extends AuthState {
  final String? errorMassage;
  ResetPasswordErrorState({required this.errorMassage});
}

class UpdateValidationState extends AuthState {}

