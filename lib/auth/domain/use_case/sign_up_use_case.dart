import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../data/models/request_model/sign_up_request_model.dart';
import '../repository/auth_repository.dart';

@injectable
class SignUpUseCase {
  final AuthRepository _repo;

  SignUpUseCase(this._repo);

  Future<Result<String?>> invoke(SignUpRequestModel signUpRequestModel) async {
    return await _repo.signUp(signUpRequestModel);
  }
}
