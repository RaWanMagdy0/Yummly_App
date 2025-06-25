import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummly_app/core/utils/custom_scaffold.dart';
import 'package:yummly_app/core/styles/fonts/app_fonts.dart';
import '../../../../../../core/const/custom/custom_botton.dart';
import '../../../../../../core/const/custom/custom_text_form_field.dart';
import '../../../../../../core/const/validators/validators.dart';
import '../../../../../../core/routes/page_route_name.dart';
import '../../../../../../core/styles/colors/app_colors.dart';
import '../../view_model/auth_states.dart';
import '../../view_model/auth_view_model.dart';

class SignUpMainScreen extends StatefulWidget {
  const SignUpMainScreen({super.key});

  @override
  State<SignUpMainScreen> createState() => _SignUpMainScreenState();
}

class _SignUpMainScreenState extends State<SignUpMainScreen> {
  late AuthCubit viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = context.read<AuthCubit>();
  }

  @override
  void dispose() {
    viewModel.fullNameController.dispose();
    viewModel.phoneNumberController.dispose();
    viewModel.emailController.dispose();
    viewModel.passwordNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      bloc: viewModel,
      listener: (context, state) => _handelStateChange(state),
      child: CustomScaffold(
        child: Form(
          key: viewModel.formKey,
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
                            PageRouteName.signIn,
                          );
                        },
                        child:
                            Text("Login", style: AppFonts.font20BlackWeight400),
                      ),
                    ],
                  ),
                  70.verticalSpace,
                  Row(
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 35.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.kBlack,
                        ),
                      ),
                    ],
                  ),
                  50.verticalSpace,
                  CustomTextFormField(
                    backgroundColor:
                        AppColors.kBaseColor.withValues(alpha: 0.2),
                    borderColor: Colors.transparent,
                    hintText: "Full Name",
                    keyBordType: TextInputType.text,
                    controller: viewModel.fullNameController,
                    validator: (value) => Validators.validateName(value),
                  ),
                  20.verticalSpace,
                  CustomTextFormField(
                    backgroundColor:
                        AppColors.kBaseColor.withValues(alpha: 0.2),
                    borderColor: Colors.transparent,
                    hintText: "Email",
                    keyBordType: TextInputType.text,
                    controller: viewModel.emailController,
                    validator: (value) => Validators.validateEmail(value),
                  ),
                  20.verticalSpace,
                  CustomTextFormField(
                    backgroundColor:
                        AppColors.kBaseColor.withValues(alpha: 0.2),
                    borderColor: Colors.transparent,
                    hintText: "Phone Number",
                    keyBordType: TextInputType.text,
                    controller: viewModel.phoneNumberController,
                    validator: (value) => Validators.validatePhoneNumber(value),
                  ),
                  20.verticalSpace,
                  CustomTextFormField(
                    backgroundColor:
                        AppColors.kBaseColor.withValues(alpha: 0.2),
                    borderColor: Colors.transparent,
                    hintText: "Password",
                    keyBordType: TextInputType.text,
                    isPassword: true,
                    controller: viewModel.passwordNameController,
                    validator: (value) => Validators.validatePassword(value),
                  ),
                  50.verticalSpace,
                  Text(
                    "By registering you agree to our Terms and Conditions",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  10.verticalSpace,
                  CustomButton(
                    onPressed: () => viewModel.validateSignUp(),
                    color: AppColors.kBaseColor.withValues(alpha: 0.6),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: AppColors.kWhite,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handelStateChange(AuthState state) {
    if (state is SignUpSuccess) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(
        content: Text(
          state.message ?? "success",
          style: TextStyle(color: AppColors.kWhite),
        ),
        backgroundColor: Colors.green,
      ));
    } else if (state is SignUpFail) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(
        content: Text(state.errorMassage ?? ""),
        backgroundColor: AppColors.kRed,
      ));
    } else if (state is SignUpLoading) {}
  }
}
