import '../../../core/api/api_result.dart';
import '../../data/models/request_model/reset_password_request_model.dart';
import '../../data/models/request_model/sign_in_request_model.dart';
import '../../data/models/request_model/sign_up_request_model.dart';
import '../entity/login_entity.dart';

abstract class AuthRepository {
  Future<Result<String?>> signUp(SignUpRequestModel signUpRequestModel);
  Future<Result<String?>> signin(LoginRequestBodyModel signInRequestBody);
  Future<Result<String?>> forgotPassword({required String email});
  Future<Result<String?>> verifyResetCode({required requestBody});
  Future<Result<String?>> resetPassword(
    ResetPasswordRequestModel resetPassword,
  );
  Future<UserEntity> signInWithGoogle();
  Future<void> signOut();

}
