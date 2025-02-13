import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummly_app/auth/presentation/auth/view/forget_password/reset_password.dart';
import 'package:yummly_app/auth/presentation/auth/view_model/auth_states.dart';
import '../../../../../../core/di/di.dart';
import '../../view_model/auth_view_model.dart';
import '../../widget/email_verification_widget.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});
  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  var viewModel = getIt.get<AuthCubit>();
  List<Widget> page = [];
  @override
  void initState() {
    super.initState();
    viewModel = context.read<AuthCubit>();
    page = [
      EmailVerificationWidget(viewModel: viewModel),
      ResetPasswordViewBody(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      bloc: viewModel,
      listener: (context, state) => _handleStateChange(state),
      child: Scaffold(
        body: PageView(
         controller: viewModel.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: page,
        ),

      ),
    );
  }

  dynamic _handleStateChange(AuthState state) {
    if (state is VerifyEmailCodeSuccessState) {
      viewModel.pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      viewModel.startResendTimer();
    } else if (state is VerifyEmailCodeLoadingState) {
      //  AppDialogs.showLoading(context: context);
    } else if (state is VerifyEmailCodeErrorState) {
      /***************
          Navigator.pop(context);
          AppDialogs.showErrorDialog(
          context: context,
          errorMassage: state.errorMassage ?? "An unknown error occurred",
          );
    } else if (state is ResendLoadingState) {
    //  AppDialogs.showLoading(context: context);
    } else if (state is ResendSuccessState) {
      Navigator.pop(context);

      AppDialogs.showSuccessDialog(
        context: context,
        message: "Resend OTP to your email.\n Please check your Email",
      );
      viewModel.startResendTimer();
    } else if (state is ResendErrorState) {
      Navigator.pop(context);
     // AppDialogs.showErrorDialog(context: context, errorMassage: state.errorMassage ?? "An unknown error occurred",);
    }
  }
       *****/
    }
  }
}
