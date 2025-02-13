import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../data/models/request_model/sign_in_request_model.dart';
import '../repository/auth_repository.dart';

@injectable
class SignInUseCase {
  final AuthRepository _repo;

  SignInUseCase(this._repo);

  Future<Result<String?>> invoke(LoginRequestBodyModel signInRequestBody) async {
    return await _repo.signin(signInRequestBody);
  }
}
