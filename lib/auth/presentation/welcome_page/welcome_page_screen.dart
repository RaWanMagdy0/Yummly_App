import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/const/custom/custom_botton.dart';
import '../../../../core/routes/page_route_name.dart';
import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/styles/images/app_images.dart';

class WelcomePageScreen extends StatelessWidget {
  const WelcomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset(AppImages.welcomePage, fit: BoxFit.fill),
            Positioned(
              bottom: 90.h,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    Text("Meals On \n Demand",style: TextStyle(
                      fontSize: 30.sp,
                      color: AppColors.kWhite,
                      fontWeight: FontWeight.w500,
                    ),),
                    160.verticalSpace,
                    CustomButton(
                      onPressed: (){
                        Navigator.pushNamed(context, PageRouteName.pageView);
                      },
                      width: 200.w,
                      height: 50.h,
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.all(12.r),
                      disabledBackgroundColor: Colors.white,
                      child: Text(
                        "Lets Start",
                        style: TextStyle(
                          fontSize: 18.sp,
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