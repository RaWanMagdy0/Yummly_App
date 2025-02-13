import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/api/api_const.dart';
import '../models/request_model/reset_password_request_model.dart';
import '../models/request_model/sign_in_request_model.dart';
import '../models/request_model/sign_up_request_model.dart';
import '../models/response_model/sign_in_model/sign_in_response_model.dart';
import '../models/response_model/sign_up_model/sign_up_response_model.dart';
part 'api_manger.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthApiManager {
  @factoryMethod
  factory AuthApiManager(Dio dio) = _AuthApiManager;

  @POST(ApiConstants.signUp)
  Future<SignupResponseModel?> signUp(
    @Body() SignUpRequestModel signUpRequestBody,
  );

  @POST(ApiConstants.signIn)
  Future<SignInResponseModel> signIn(
    @Body() LoginRequestBodyModel signInRequestBody,
  );
  @POST(ApiConstants.forgetPassword)
  Future<String?> forgetPassword(@Body() Map<String, dynamic> email);
  @POST(ApiConstants.verifyResetCode)
  Future<String?> verifyResetCode(@Body() Map<String, dynamic> requestBody);
  @PUT(ApiConstants.resetPassword)
  Future<String?> resetPassword(@Body() ResetPasswordRequestModel resetPassword);
}
