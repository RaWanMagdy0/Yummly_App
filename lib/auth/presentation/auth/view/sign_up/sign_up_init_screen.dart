import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummly_app/core/styles/fonts/app_fonts.dart';
import 'package:yummly_app/core/utils/app_dialogs.dart';
import '../../../../../core/routes/page_route_name.dart';
import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../core/styles/assets/app_images.dart';
import '../../view_model/auth_states.dart';
import '../../view_model/auth_view_model.dart';
import '../../widget/custom_auth_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpInitScreen extends StatefulWidget {
  const SignUpInitScreen({super.key});

  @override
  State<SignUpInitScreen> createState() => _SignUpInitScreenState();
}

class _SignUpInitScreenState extends State<SignUpInitScreen> {
  late AuthCubit viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = context.read<AuthCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is SignInWithGoogleSuccess) {
          AppDialogs.showSuccessDialog(
            context: context,
            message: "Login Successfully With Google Account",
            whenAnimationFinished: () {
              Navigator.pushReplacementNamed(
                  context, PageRouteName.categoryScreen);
            },
          );
        } else if (state is SignInWithGoogleFail) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMassage ?? "")));
        } else if (state is SignInWithGoogleLoading) {}
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(AppImages.register, fit: BoxFit.cover),
              80.verticalSpace,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  fixedSize: Size(300.w, 50.h),
                  backgroundColor: AppColors.kBaseColor.withValues(alpha: 0.9),
                  overlayColor: Colors.white.withValues(alpha: 0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    side: BorderSide(color: Colors.transparent, width: 1.w),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, PageRouteName.signUpMain);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email_outlined, color: AppColors.kCreamy),
                    10.horizontalSpace,
                    Text(
                      "Register Using Email",
                      style: TextStyle(color: AppColors.kCreamy),
                    ),
                  ],
                ),
              ),
              15.verticalSpace,
              const CustomAuthRow(),
              15.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Have an account?",
                      style: AppFonts.font15BlackWeight400),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, PageRouteName.signIn);
                    },
                    child: Text(" Login", style: AppFonts.font15BlackWeight700),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
