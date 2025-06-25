import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummly_app/category/presention/widgets/custom_card.dart';
import 'package:yummly_app/core/utils/custom_scaffold.dart';
import 'package:yummly_app/core/styles/assets/app_images.dart';
import 'package:yummly_app/core/styles/fonts/app_fonts.dart';
import '../../../core/styles/colors/app_colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
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
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.search,
                    size: 30.sp,
                    color: AppColors.kBlack,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Categories",
                  style: AppFonts.font40BlackWeight400,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return CustomCategoryCard(
                    title: "12 recipe",
                    imagePath: AppImages.categoryImage,
                    recipes: "SeaFood",
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
