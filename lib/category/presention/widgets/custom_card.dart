import 'package:flutter/material.dart';
import 'package:yummly_app/core/styles/fonts/app_fonts.dart';

class CustomCategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String recipes;

  const CustomCategoryCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.1),
                  Colors.black.withValues(alpha: 0.7),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$recipes Recipes",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                Text(title, style: AppFonts.font18whiteWeightBold),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
