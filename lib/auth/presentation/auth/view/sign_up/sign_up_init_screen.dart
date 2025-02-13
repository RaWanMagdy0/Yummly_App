import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/const/custom/custom_botton.dart';
import '../../../../../core/routes/page_route_name.dart';
import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../core/styles/images/app_images.dart';
import '../../widget/custom_auth_row.dart';

class SignUpInitScreen extends StatelessWidget {
  const SignUpInitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(AppImages.register, fit: BoxFit.cover),
          100.verticalSpace,
          SizedBox(
            width: 300.w,
            child: CustomButton(
              onPressed: (){
                Navigator.pushNamed(context, PageRouteName.signUpMain);
              },
              height: 60.h,
              disabledBackgroundColor: AppColors.kWhite,
              color: AppColors.kBaseColor.withOpacity(0.9),
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
          ),
          15.verticalSpace,
          CustomAuthRow(),
          30.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Have an account?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.kBlack,
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, PageRouteName.signIn);

                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.kBlack,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
