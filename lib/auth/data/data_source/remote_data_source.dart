import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/api/api_result.dart';
import '../models/request_model/reset_password_request_model.dart';
import '../models/request_model/sign_in_request_model.dart';
import '../models/request_model/sign_up_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<Result<String?>> signup(SignUpRequestModel signUpRequestModel);
  Future<Result<String?>> signin(LoginRequestBodyModel signInRequestBody);
  Future<Result<String?>> forgotPassword({required String email});
  Future<Result<String?>> verifyResetCode({required requestBody});
  Future<Result<String?>> resetPassword(ResetPasswordRequestModel resetPassword);
  Future<User?> signInWithGoogle();
  Future<void> signOut();
}
