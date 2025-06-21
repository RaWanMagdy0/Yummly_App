import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummly_app/core/styles/images/app_images.dart';
import '../../../../../core/const/custom/custom_text_form_field.dart';
import '../../../../../core/const/validators/validators.dart';
import '../../../../../core/routes/page_route_name.dart';
import '../../../../../core/styles/colors/app_colors.dart';
import '../../view_model/auth_states.dart';
import '../../view_model/auth_view_model.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late final AuthCubit viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = context.read<AuthCubit>();
  }

  @override
  Widget build(BuildContext context) {
    // final local = S.of(context);
    return BlocListener<AuthCubit, AuthState>(
      bloc: viewModel,
      listener: (context, state) => _handelStateChange(state),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          child: Stack(
            children: [
              Image.asset(AppImages.registerEmpty),
              Positioned(
                top: 170,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        // IconButton(icon: Icon(Icons.arrow_back_ios_outlined), onPressed: () => Navigator.pop(context),),
                        Text(
                          "Forgot \nPassword ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 35.sp,
                            color: AppColors.kBlack,
                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    Row(
                      children: [
                        Text(
                          "please enter your email associated to\n your account",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp,
                            color: AppColors.kBlack,
                          ),
                        ),
                      ],
                    ),
                    30.verticalSpace,
                    Form(
                      //   autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: viewModel.formKey,
                      child: CustomTextFormField(
                        backgroundColor:
                            AppColors.kBaseColor.withValues(alpha: 0.2),
                        hintText: "Email",
                        //labelText: "local.emailLabelText",
                        validator: (value) => Validators.validateEmail(value),
                        keyBordType: TextInputType.text,
                        controller: viewModel.emailController,
                      ),
                    ),
                    180.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 80.w,
                              vertical: 15.h,
                            ),
                            backgroundColor:
                                AppColors.kBaseColor.withValues(alpha: 0.6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          onPressed: () => viewModel.submitForgotPassword(),
                          child: Text(
                            "Next >",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.kWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handelStateChange(AuthState state) {
    // Fixed method name typo
    if (state is ForgotPasswordLoadingState) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
          child: CircularProgressIndicator(color: AppColors.kBaseColor),
        ),
      );
    } else if (state is ForgotPasswordSuccessState) {
      Navigator.pop(context); // Dismiss loading
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("OTP sent to your email. Please check your Email"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushNamed(context, PageRouteName.passwordVerification);
    } else if (state is ForgotPasswordErrorState) {
      Navigator.pop(context); // Dismiss loading
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMassage ?? "An error occurred"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
