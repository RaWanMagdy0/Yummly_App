import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:yummly_app/auth/presentation/auth/view_model/auth_states.dart';
import 'package:yummly_app/core/styles/images/app_images.dart';
import '../../../../../core/const/custom/custom_text_form_field.dart';
import '../../../../../core/const/validators/validators.dart';
import '../../../../../core/routes/page_route_name.dart';
import '../../../../../core/styles/colors/app_colors.dart';
import '../../view_model/auth_view_model.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final _resetPasswordViewModel = GetIt.instance.get<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    // final local = S.of(context);
    return BlocListener<AuthCubit, AuthState>(
      bloc: _resetPasswordViewModel,
      listener: (context, state) => _handelStateChange(state),
      child: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Form(
          key: _resetPasswordViewModel.formKey,
          child: Stack(
            children: [
              Image.asset(AppImages.registerEmpty),
              Positioned(
                top: 190,
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Reset \nPassword",
                            style: TextStyle(
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      10.verticalSpace,
                      Row(
                        children: [
                          Text(
                            "Password must not be empty and must contain\n 6 characters with upper case letter and one\n number at least",
                            textAlign: TextAlign.center,
                            //  style: AppFonts.font14BlackWeight400
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      CustomTextFormField(
                        backgroundColor:
                            AppColors.kBaseColor.withValues(alpha: 0.2),
                        hintText: "New Password",
                        //   labelText: "local.passwordLabelText",
                        controller:
                            _resetPasswordViewModel.newPasswordController,
                        keyBordType: TextInputType.text,
                        isPassword: true,
                        validator: (value) =>
                            Validators.validatePassword(value),
                      ),
                      20.verticalSpace,
                      CustomTextFormField(
                        backgroundColor:
                            AppColors.kBaseColor.withValues(alpha: 0.2),

                        hintText: "Confirm Password",
                        //  labelText: "local.confirmPasswordHintText",
                        controller:
                            _resetPasswordViewModel.confirmPasswordController,
                        keyBordType: TextInputType.text,
                        isPassword: true,
                        validator: (value) =>
                            Validators.validatePasswordConfirmation(
                          password: _resetPasswordViewModel
                              .newPasswordController.text,
                          confirmPassword: value,
                        ),
                      ),
                      170.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 70.w,
                                vertical: 15.h,
                              ),
                              backgroundColor:
                                  AppColors.kBaseColor.withValues(alpha: 0.6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            onPressed: () {
                              _resetPasswordViewModel.validateResetPassword();
                            },
                            child: Text(
                              "Next   >",
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handelStateChange(AuthState state) {
    if (state is ResetPasswordSuccessState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password changed successfully"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushNamedAndRemoveUntil(
        context,
        PageRouteName.signIn,
        (route) => false,
      );
    } else if (state is ResetPasswordErrorState) {
      Navigator.pop(context); // Dismiss loading
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.errorMassage ?? "An error occurred"),
          backgroundColor: Colors.red,
        ),
      );
    } else if (state is ResetPasswordLoadingState) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
          child: CircularProgressIndicator(color: AppColors.kBaseColor),
        ),
      );
    }
  }
}
