import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummly_app/core/routes/page_route_name.dart';
import '../../auth/presentation/auth/view/forget_password/email_verification.dart';
import '../../auth/presentation/auth/view/forget_password/fogot_password.dart';
import '../../auth/presentation/auth/view/forget_password/reset_password.dart';
import '../../auth/presentation/auth/view/sign_in/sign_in_screen.dart';
import '../../auth/presentation/auth/view/sign_up/sign_up_init_screen.dart';
import '../../auth/presentation/auth/view/sign_up/sign_up_main_screen.dart';
import '../../auth/presentation/auth/view_model/auth_view_model.dart';
import '../../auth/presentation/welcome_page/page_view.dart';
import '../../auth/presentation/welcome_page/welcome_page_screen.dart';
import '../di/di.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case PageRouteName.welcomePage:
        return _handleMaterialPageRoute(widget: const WelcomePageScreen());
      case PageRouteName.pageView:
        return _handleMaterialPageRoute(widget: const PageViewScreen());
      case PageRouteName.signUpInit:
        return _handleMaterialPageRoute(widget: const SignUpInitScreen());
      case PageRouteName.signUpMain:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<AuthCubit>(),
                child: SignUpMainScreen(),
              ),
        );
      case PageRouteName.signIn:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<AuthCubit>(),
                child: SignInScreen(),
              ),
        );
      case PageRouteName.forgotPassword:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<AuthCubit>(),
                child: ForgetPassword(),
              ),
        );
      case PageRouteName.passwordVerification:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<AuthCubit>(),
                child: EmailVerification(),
              ),
        );
      case PageRouteName.resetPassword:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt<AuthCubit>(),
                child: ResetPasswordViewBody(),
              ),
        );

      default:
        return _handleMaterialPageRoute(widget: const Scaffold());
    }
  }

  static MaterialPageRoute<dynamic> _handleMaterialPageRoute({
    required Widget widget,
  }) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
