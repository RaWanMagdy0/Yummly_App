import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummly_app/core/styles/colors/app_colors.dart';
import 'package:yummly_app/core/styles/fonts/app_fonts.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      decoration: BoxDecoration(
        color: AppColors.kBaseColor.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.upload_sharp),
            5.verticalSpace,
            Text(
              "Upload Image",
              style: AppFonts.font15BlackWeight400,
            )
          ],
        ),
      ),
    );
  }
}
