import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/page_route_name.dart';
import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/styles/images/app_images.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final PageController pageController = PageController();
  double currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!;
      });
      if (currentPage >= 2) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            Navigator.pushNamed(context, PageRouteName.signUpInit);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget _buildPage(
    String imagePath,
    String title,
    String subtitle, {
    double right = 0,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Stack(
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Positioned(
                bottom: 100.h,
                left: 15,
                right: right,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 30.sp,
                          color: AppColors.kWhite,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      20.verticalSpace,
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColors.kWhite,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            children: [
              _buildPage(
                AppImages.product,
                "Share Your \n Recipes",
                "Let your creativity inspire others!",
                right: 120,
              ),
              _buildPage(
                AppImages.product2,
                "Learn To \n Cook",
                "Create delicious dishes with ease",
                right: 120,
              ),
              _buildPage(
                AppImages.product3,
                "Become a Master \n Chef",
                "Discover quick and varied recipes for preparing remedies!",
              ),
            ],
          ),
          // Linear Indicator
          Positioned(
            bottom: 60.h,
            left: 0,
            right: 0,
            child: Container(
              height: 5.h,
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(15.r),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 120),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      Container(
                        width: constraints.maxWidth,
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      // Animated Line
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: constraints.maxWidth / 3 * (currentPage + 1),
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: AppColors.kBaseColor,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                    ],
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
