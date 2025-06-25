import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummly_app/core/const/validators/validators.dart';
import 'package:yummly_app/core/utils/custom_scaffold.dart';
import 'package:yummly_app/core/styles/fonts/app_fonts.dart';
import '../../../../../../core/const/custom/custom_botton.dart';
import '../../../../../../core/const/custom/custom_text_form_field.dart';
import '../../../../../../core/routes/page_route_name.dart';
import '../../../../../../core/styles/colors/app_colors.dart';

import '../../../../../core/utils/app_dialogs.dart';
import '../../view_model/auth_states.dart';
import '../../view_model/auth_view_model.dart';
import '../../widget/custom_auth_row.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
        switch (state) {
          case SignInLoading():
            {
              AppDialogs.showLoading(context: context);
              //CircularProgressIndicator(color: AppColors.kBaseColor);
            }
          case SignInFail():
            {
              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMassage ?? "Failed to sign in"), backgroundColor: AppColors.kRed,),);
              AppDialogs.showHideDialog(context);
              AppDialogs.showErrorDialog(
                context: context,
                errorMassage: state.errorMassage ?? "",
              );
            }
          case SignInSuccess():
            {
              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message ?? "success", style: TextStyle(color: AppColors.kWhite),), backgroundColor: AppColors.kBaseColor,),);
              AppDialogs.showSuccessDialog(
                context: context,
                message: "Login Successfully",
                whenAnimationFinished: () {
                  Navigator.pop(context);

                  Navigator.pushNamed(context, PageRouteName.categoryScreen);
                },
              );
            }
          default:
            {}
        }
      },
      child: CustomScaffold(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: AppColors.kBaseColor.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_sharp,
                        size: 20.sp,
                        color: AppColors.kWhite,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          PageRouteName.signUpMain,
                        );
                      },
                      child: Text("Register",
                          style: AppFonts.font20BlackWeight400),
                    ),
                  ],
                ),
                70.verticalSpace,
                Row(
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kBlack,
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                CustomTextFormField(
                  backgroundColor: AppColors.kBaseColor.withValues(alpha: 0.2),
                  borderColor: Colors.transparent,
                  hintText: "Email",
                  keyBordType: TextInputType.text,
                  controller: viewModel.emailController,
                  validator: (value) => Validators.validateEmail(value),
                ),
                20.verticalSpace,
                CustomTextFormField(
                  backgroundColor: AppColors.kBaseColor.withValues(alpha: 0.2),
                  borderColor: Colors.transparent,
                  hintText: "Password",
                  keyBordType: TextInputType.text,
                  validator: (value) => Validators.validatePassword(value),
                  controller: viewModel.passwordNameController,
                ),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, PageRouteName.forgotPassword);
                      },
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(
                          //color: AppColors.kWhite,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                150.verticalSpace,
                CustomButton(
                  onPressed: () {
                    viewModel.validateSignIn();
                  },
                  color: AppColors.kBaseColor.withValues(alpha: 0.6),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: AppColors.kWhite,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                15.verticalSpace,
                CustomAuthRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
