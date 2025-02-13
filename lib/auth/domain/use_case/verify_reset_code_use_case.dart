import 'package:injectable/injectable.dart';

import '../../../core/api/api_result.dart';
import '../repository/auth_repository.dart';

@injectable
class VerifyResetCodeUseCase {
  AuthRepository repository;
  VerifyResetCodeUseCase({required this.repository});
  Future<Result<String?>> invoke({
    required String verficationCode,
    required String email,
  }) {
    final requestBody = {
      "email": email,
      "verficationCode": verficationCode,
    };
    return repository.verifyResetCode( requestBody: requestBody);
  }

}
