import 'package:injectable/injectable.dart';

import '../entity/login_entity.dart';
import '../repository/auth_repository.dart';
@injectable

class SignInWithGoogleUseCase {
  final AuthRepository repository;

  SignInWithGoogleUseCase(this.repository);

  Future<UserEntity> invoke() async {
    return await repository.signInWithGoogle();
  }
}
