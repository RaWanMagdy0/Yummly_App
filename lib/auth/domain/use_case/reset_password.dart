import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../../data/models/request_model/reset_password_request_model.dart';
import '../repository/auth_repository.dart';

@injectable
class ResetPasswordUseCase {
  AuthRepository repository;
  ResetPasswordUseCase({required this.repository});
  Future<Result<String?>> invoke(ResetPasswordRequestModel resetPassword) {
    return repository.resetPassword(resetPassword);
  }
}
