import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/const/custom/custom_botton.dart';
import '../../../../core/routes/page_route_name.dart';
import '../../../../core/styles/colors/app_colors.dart';
import '../../../core/styles/assets/app_images.dart';

class WelcomePageScreen extends StatelessWidget {
  const WelcomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              AppImages.welcomePage,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              bottom: 70.h < 40 ? 40 : 70.h,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Meals On\nDemand",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.sp < 16 ? 16 : 30.sp,
                        color: AppColors.kWhite,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    (160.h < 60 ? 60 : 160.h).verticalSpace,
                    CustomButton(
                      onPressed: () {
                        Navigator.pushNamed(context, PageRouteName.pageView);
                      },
                      width: 200.w < 120 ? 120 : 200.w,
                      height: 50.h < 36 ? 36 : 50.h,
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.all(12.r < 6 ? 6 : 12.r),
                      disabledBackgroundColor: Colors.white,
                      child: Text(
                        "Lets Start",
                        style: TextStyle(
                          fontSize: 18.sp < 12 ? 12 : 18.sp,
                          color: AppColors.kBlack,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
