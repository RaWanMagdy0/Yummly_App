// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;

import '../../auth/data/api/api_manger.dart' as _i165;
import '../../auth/data/data_source/remote_data_source.dart' as _i108;
import '../../auth/data/data_source/remote_data_source_impl.dart' as _i896;
import '../../auth/data/fire_base/fire_base_module.dart' as _i304;
import '../../auth/data/repository/auth_repository_impl.dart' as _i727;
import '../../auth/domain/repository/auth_repository.dart' as _i616;
import '../../auth/domain/use_case/forgot_password_use_case.dart' as _i24;
import '../../auth/domain/use_case/reset_password.dart' as _i785;
import '../../auth/domain/use_case/sign_in_use_case.dart' as _i464;
import '../../auth/domain/use_case/sign_up_use_case.dart' as _i29;
import '../../auth/domain/use_case/sign_up_with_google.dart' as _i655;
import '../../auth/domain/use_case/verify_reset_code_use_case.dart' as _i1056;
import '../../auth/presentation/auth/view_model/auth_view_model.dart' as _i975;
import '../api/dio/dio_factory.dart' as _i763;
import '../api/dio/dio_module.dart' as _i223;
import '../const/provider/app_provider.dart' as _i787;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final firebaseModule = _$FirebaseModule();
    gh.factory<_i763.DioFactory>(() => _i763.DioFactory());
    gh.singleton<_i787.AppProvider>(() => _i787.AppProvider());
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i116.GoogleSignIn>(() => firebaseModule.googleSignIn);
    gh.lazySingleton<_i165.AuthApiManager>(
      () => _i165.AuthApiManager(gh<_i361.Dio>()),
    );
    gh.factory<_i108.AuthRemoteDataSource>(
      () => _i896.AuthRemoteDataSourceImpl(
        gh<_i59.FirebaseAuth>(),
        gh<_i116.GoogleSignIn>(),
        gh<_i165.AuthApiManager>(),
      ),
    );
    gh.factory<_i616.AuthRepository>(
      () => _i727.AuthRepositoryImpl(gh<_i108.AuthRemoteDataSource>()),
    );
    gh.factory<_i464.SignInUseCase>(
      () => _i464.SignInUseCase(gh<_i616.AuthRepository>()),
    );
    gh.factory<_i29.SignUpUseCase>(
      () => _i29.SignUpUseCase(gh<_i616.AuthRepository>()),
    );
    gh.factory<_i24.ForgotPasswordUseCase>(
      () => _i24.ForgotPasswordUseCase(repository: gh<_i616.AuthRepository>()),
    );
    gh.factory<_i785.ResetPasswordUseCase>(
      () => _i785.ResetPasswordUseCase(repository: gh<_i616.AuthRepository>()),
    );
    gh.factory<_i1056.VerifyResetCodeUseCase>(
      () =>
          _i1056.VerifyResetCodeUseCase(repository: gh<_i616.AuthRepository>()),
    );
    gh.factory<_i655.SignInWithGoogleUseCase>(
      () => _i655.SignInWithGoogleUseCase(gh<_i616.AuthRepository>()),
    );
    gh.factory<_i975.AuthCubit>(
      () => _i975.AuthCubit(
        gh<_i785.ResetPasswordUseCase>(),
        gh<_i1056.VerifyResetCodeUseCase>(),
        gh<_i464.SignInUseCase>(),
        gh<_i29.SignUpUseCase>(),
        gh<_i24.ForgotPasswordUseCase>(),
        gh<_i655.SignInWithGoogleUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i223.DioModule {}

class _$FirebaseModule extends _i304.FirebaseModule {}
