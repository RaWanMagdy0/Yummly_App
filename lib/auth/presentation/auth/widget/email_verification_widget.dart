import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummly_app/core/styles/colors/app_colors.dart';
import 'package:yummly_app/core/styles/fonts/app_fonts.dart';
import '../../../../core/const/provider/app_provider.dart';
import '../../../../core/di/di.dart';
import '../../../../core/styles/assets/app_images.dart';
import '../view_model/auth_view_model.dart';
import 'pin_code_file.dart';

class EmailVerificationWidget extends StatelessWidget {
  final AuthCubit viewModel;
  EmailVerificationWidget({super.key, required this.viewModel});
  final appProvider = getIt.get<AppProvider>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
      child: Stack(
        children: [
          Image.asset(AppImages.registerEmpty),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  children: [
                    //  Icon(Icons.arrow_back_ios_outlined),
                    Text("Verify Phone", style: AppFonts.font35BlackWeight500),
                  ],
                ),
                15.verticalSpace,
                Row(
                  children: [
                    Text(
                        "Please enter your code that send to your\n email address",
                        style: AppFonts.font15BlackWeight400),
                  ],
                ),
                40.verticalSpace,
                PinCodeFile(
                  onCodeCompleted: (verficationCode) {
                    if (verficationCode.isNotEmpty) {
                      if (kDebugMode) {
                        print("Verification Code Entered: $verficationCode");
                      }
                      viewModel.verifyResetCode(
                        verficationCode: verficationCode,
                        email: appProvider.email,
                      );
                    } else {
                      if (kDebugMode) {
                        print("Error: Verification Code is Empty");
                      }
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Did not Receive Code?",
                        style: AppFonts.font18BlackWeight500),
                    ValueListenableBuilder<bool>(
                      valueListenable: viewModel.isResendButtonEnabled,
                      builder: (context, isEnabled, child) {
                        return InkWell(
                          onTap: isEnabled
                              ? () {
                                  viewModel.resendResetCode();
                                }
                              : null,
                          child: ValueListenableBuilder<String?>(
                            valueListenable: viewModel.resendButtonText,
                            builder: (context, value, child) {
                              return Text(value ?? " Resend",
                                  style: isEnabled
                                      ? AppFonts.font16BaseColorWeight400
                                      : AppFonts.font16BaseColorWeight400);
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
                50.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 90.w,
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
                        "Verify and continue    >",
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
    );
  }
}
