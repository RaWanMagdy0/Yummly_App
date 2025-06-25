import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummly_app/core/styles/colors/app_colors.dart';

class CustomBackArrow extends StatelessWidget {
  const CustomBackArrow({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
