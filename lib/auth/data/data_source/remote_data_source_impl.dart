import 'package:injectable/injectable.dart';
import 'package:yummly_app/auth/data/data_source/remote_data_source.dart';
import 'package:yummly_app/auth/data/models/request_model/forgot_password_request_model.dart';
import 'package:yummly_app/auth/data/models/request_model/reset_password_request_model.dart';

import '../../../core/api/api_result.dart';
import '../../../core/api/execute_api_call.dart';
import '../api/api_manger.dart';
import '../models/request_model/sign_in_request_model.dart';
import '../models/request_model/sign_up_request_model.dart';


@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource{
  AuthApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Result<String?>> signup(SignUpRequestModel signUpRequestModel) {
    return executeApiCall<String?>(() async {
      final response = await apiManager.signUp(signUpRequestModel);
      return response?.message;
    });
  }

  @override
  Future<Result<String?>> signin(LoginRequestBodyModel signInRequestBody) {
    return executeApiCall<String?>(() async {
      final response = await apiManager.signIn(signInRequestBody);
      return response.message;
    });
  }

  @override
  Future<Result<String?>> forgotPassword( {required String email}) {
    return executeApiCall<String?>(() async {
      String? message = await apiManager.forgetPassword({'email': email});
      return message;
    });
  }

  @override
  Future<Result<String?>> verifyResetCode({required requestBody}) {
    return executeApiCall<String?>(() async {
      String? message = await apiManager.verifyResetCode(requestBody);
      return message;
    });}

  @override
  Future<Result<String?>> resetPassword(ResetPasswordRequestModel resetPassword) {
    return executeApiCall<String?>(() async {
      String? message = await apiManager.resetPassword(resetPassword);
      return message;
    });}

}