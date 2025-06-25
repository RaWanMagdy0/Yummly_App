import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yummly_app/add_recipe/presentaion/widgets/difficulty_row.dart';
import 'package:yummly_app/add_recipe/presentaion/widgets/image_component.dart';
import 'package:yummly_app/add_recipe/presentaion/widgets/information_row.dart';
import 'package:yummly_app/core/const/custom/custom_botton.dart';
import 'package:yummly_app/core/const/custom/custom_text_form_field.dart';
import 'package:yummly_app/core/styles/colors/app_colors.dart';
import 'package:yummly_app/core/utils/custom_back_arrow.dart';
import 'package:yummly_app/core/utils/custom_scaffold.dart';
import 'package:yummly_app/core/styles/fonts/app_fonts.dart';

class AddRecipe extends StatelessWidget {
  const AddRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomBackArrow(
                          onTap: () => Navigator.pop(context),
                        ),
                        60.horizontalSpace,
                        Text(
                          "Add Recipe",
                          style: AppFonts.font20BlackWeight400,
                        ),
                      ],
                    ),
                    30.verticalSpace,
                    Row(
                      children: [
                        Text(
                          "Recipe Name",
                          style: AppFonts.font20BlackWeight400,
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    CustomTextFormField(
                      hintText: "Enter Recipe Name",
                      hintStyle: AppFonts.font15BlackWeight400,
                      backgroundColor:
                          AppColors.kBaseColor.withValues(alpha: 0.3),
                    ),
                    10.verticalSpace,
                    ImageComponent(),
                    20.verticalSpace,
                    Row(
                      children: [
                        Text(
                          "Information",
                          style: AppFonts.font20BlackWeight400,
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    InformationRow(
                      text: 'Preparation Time',
                    ),
                    10.verticalSpace,
                    DifficultyRow(),
                    10.verticalSpace,
                  ],
                ),
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.only(top: 10.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      width: 200.w,
                      height: 50.h,
                      backgroundColor:
                          AppColors.kBaseColor.withValues(alpha: 0.7),
                      onPressed: () {},
                      child: Text(
                        "Submit",
                        style: AppFonts.font18whiteWeightBold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
