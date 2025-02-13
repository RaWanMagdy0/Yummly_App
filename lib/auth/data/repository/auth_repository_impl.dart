import 'package:injectable/injectable.dart';
import 'package:yummly_app/auth/data/models/request_model/forgot_password_request_model.dart';
import 'package:yummly_app/auth/data/models/request_model/reset_password_request_model.dart';

import '../../../core/api/api_result.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/remote_data_source.dart';
import '../models/request_model/sign_in_request_model.dart';
import '../models/request_model/sign_up_request_model.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource dataSource;
  AuthRepositoryImpl(this.dataSource);

  @override
  Future<Result<String?>> signUp(SignUpRequestModel signUpRequestModel) async {
    return await dataSource.signup(signUpRequestModel);
  }

  @override
  Future<Result<String?>> signin(
    LoginRequestBodyModel signInRequestBody,
  ) async {
    return await dataSource.signin(signInRequestBody);
  }

  @override
  Future<Result<String?>> forgotPassword({required String email}) async {
    return await dataSource.forgotPassword(email: email);
  }

  @override
  Future<Result<String?>> verifyResetCode({required requestBody}) async {
    return await dataSource.verifyResetCode(
      requestBody:requestBody
    );
  }

  @override
  Future<Result<String?>> resetPassword(
    ResetPasswordRequestModel resetPassword,
  ) async {
    return await dataSource.resetPassword(resetPassword);
  }
}
