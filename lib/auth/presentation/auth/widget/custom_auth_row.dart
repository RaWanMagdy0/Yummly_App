import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/styles/images/app_images.dart';

class CustomAuthRow extends StatelessWidget {
  const CustomAuthRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: Size(160.w, 50.h),
            backgroundColor: AppColors.kBaseColor.withOpacity(0.2),
            overlayColor: Colors.white.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              side: BorderSide(
                color: Colors.transparent,
                width: 1.w,
              ),
            ),
          ),
          onPressed: () {},
          child: Image.asset(AppImages.google, scale: 15),
        ),
        10.horizontalSpace,
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: Size(160.w, 50.h),
            backgroundColor: AppColors.kBaseColor.withOpacity(
              0.22,
            ),
            overlayColor: Colors.white.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              side: BorderSide(
                color: Colors.transparent,
                width: 1.w,
              ),
            ),
          ),
          onPressed: () {},
          child: Image.asset(AppImages.apple, scale: 25),
        ),
      ],
    );
  }
}
