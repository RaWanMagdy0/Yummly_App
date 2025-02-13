import 'package:injectable/injectable.dart';
import '../../../core/api/api_result.dart';
import '../../data/models/request_model/forgot_password_request_model.dart';
import '../repository/auth_repository.dart';

@injectable
class ForgotPasswordUseCase {
  AuthRepository repository;
  ForgotPasswordUseCase({required this.repository});
  Future<Result<String?>> invoke({required String email}) {
    return repository.forgotPassword(email: email);
  }
}
