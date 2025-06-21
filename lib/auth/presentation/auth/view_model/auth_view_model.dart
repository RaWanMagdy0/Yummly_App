import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:yummly_app/auth/domain/use_case/reset_password.dart';
import '../../../../../core/api/api_result.dart';
import '../../../../../core/base/base_view_model.dart';
import '../../../../core/const/provider/app_provider.dart';
import '../../../../core/di/di.dart';
import '../../../data/models/request_model/reset_password_request_model.dart';
import '../../../data/models/request_model/sign_in_request_model.dart';
import '../../../data/models/request_model/sign_up_request_model.dart';
import '../../../domain/use_case/forgot_password_use_case.dart';
import '../../../domain/use_case/sign_in_use_case.dart';
import '../../../domain/use_case/sign_up_use_case.dart';
import '../../../domain/use_case/sign_up_with_google.dart';
import '../../../domain/use_case/verify_reset_code_use_case.dart';
import 'auth_states.dart';

@injectable
class AuthCubit extends BaseViewModel<AuthState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final ForgotPasswordUseCase _forgetPasswordUseCase;
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final SignInWithGoogleUseCase signInWithGoogleUseCase;

  AuthCubit(
    this._resetPasswordUseCase,
    this._verifyResetCodeUseCase,
    this._signInUseCase,
    this._signUpUseCase,
    this._forgetPasswordUseCase, this.signInWithGoogleUseCase,
  ) : super(AuthInitial());



  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordNameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  final PageController pageController = PageController(initialPage: 0);
  ValueNotifier<String?> resendButtonText = ValueNotifier<String?>(" Resend");
  ValueNotifier<bool> isResendButtonEnabled = ValueNotifier<bool>(true);

  final appProvider = getIt.get<AppProvider>();
  String? userEmail;
  late Timer timer;
  int time = 60;
  void validateSignIn() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      final signInRequestModel = LoginRequestBodyModel(
        email: emailController.text,
        password: passwordNameController.text,
      );
      signIn(signInRequestModel);
    }
  }
  void signUp(SignUpRequestModel signUpRequestModel) async {
    emit(SignUpLoading());
    final response = await _signUpUseCase.invoke(signUpRequestModel);
    switch (response) {
      case Success<String?>():
        emit(SignUpSuccess(response.data));

      case Fail<String?>():
        emit(SignUpFail(getErrorMassageFromException(response.exception)));
    }
  }
  void validateSignUp() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      final signUpRequestModel = SignUpRequestModel(
        fullName: fullNameController.text,
        email: emailController.text,
        phoneNumber: phoneNumberController.text,
        password: passwordNameController.text,
      );
      signUp(signUpRequestModel);
    }
  }
  Future<void> forgotPassword() async {
    emit(ForgotPasswordLoadingState(loadingMessage: "loading..."));
    userEmail = emailController.text;
    appProvider.email = userEmail!;
    var result = await _forgetPasswordUseCase.invoke(email: userEmail ?? "");
    switch (result) {
      case Success<String?>():
        emit(ForgotPasswordSuccessState(success: result.data));
        break;
      case Fail<String?>():
        emit(
          ForgotPasswordErrorState(
            errorMassage: getErrorMassageFromException(result.exception),
          ),
        );
    }
  }
  Future<void> verifyResetCode({
    required String verficationCode,
    required String email,
  }) async
  {
    emit(VerifyEmailCodeLoadingState(loadingMessage: 'Loading...'));
  //  final requestBody = {"email": email, "verficationCode": verficationCode,};
    var result = await _verifyResetCodeUseCase.invoke(
      verficationCode: verficationCode,
      email: appProvider.email,
    );
    switch (result) {
      case Success<String?>():
     //   print("Verification Successful: ${result.data}");
        emit(VerifyEmailCodeSuccessState(success: result.data));

      case Fail<String?>():
     //   print("Verification Failed: ${getErrorMassageFromException(result.exception)}");
        emit(
          VerifyEmailCodeErrorState(
            errorMassage: getErrorMassageFromException(result.exception),
          ),
        );
    }
  }
  Future<void> resendResetCode() async {
    emit(ResendLoadingState(loadingMessage: "loading..."));
    var result = await _forgetPasswordUseCase.invoke(email: appProvider.email);
    switch (result) {
      case Success<String?>():
        emit(ResendSuccessState(success: result.data));
      case Fail<String?>():
        emit(
          ResendErrorState(
            errorMassage: getErrorMassageFromException(result.exception),
          ),
        );
    }
  }
  Future<void> resetPassword(ResetPasswordRequestModel resetPassword) async {
    emit(ResetPasswordLoadingState(loadingMessage: "loading..."));
    final result = await _resetPasswordUseCase.invoke(resetPassword);
    switch (result) {
      case Success<String?>():
        emit(ResetPasswordSuccessState(success: result.data));
      case Fail<String?>():
        emit(
          ResetPasswordErrorState(
            errorMassage: getErrorMassageFromException(result.exception),
          ),
        );
    }
  }
  void validateResetPassword() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      final resetPasswordRequestModel = ResetPasswordRequestModel(
        email: appProvider.email,
        confirmPassword: confirmPasswordController.text,
        newPassword: newPasswordController.text,
      );
      resetPassword(resetPasswordRequestModel);
    }
  }
  void startResendTimer() {
    time = 60;
    isResendButtonEnabled.value = false;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time > 1) {
        time--;
        resendButtonText.value = formatTime(time);
      } else {
        timer.cancel();
        resendButtonText.value = " Resend";
        isResendButtonEnabled.value = true;
      }
    });
  }
  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$remainingSeconds";
  }
  void disposeTimer() {
    timer.cancel();
  }
  void submitForgotPassword() {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      forgotPassword();
    }
  }

  Future<void> signInWithGoogle() async {
    emit(SignInWithGoogleLoading());
    try {
      final user = await signInWithGoogleUseCase.invoke();
      emit(SignInWithGoogleSuccess(user));
    } catch (e) {
      emit(SignInWithGoogleFail(e.toString()));
    }
  }
  void signIn(LoginRequestBodyModel signInRequestBody) async {
    emit(SignInLoading());
    final response = await _signInUseCase.invoke(signInRequestBody);
    switch (response) {
      case Success<String?>():
        emit(SignInSuccess(response.data));

      case Fail<String?>():
        emit(SignInFail(getErrorMassageFromException(response.exception)));
    }
  }
}
