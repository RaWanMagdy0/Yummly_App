import 'package:flutter/material.dart';
import 'package:yummly_app/core/styles/colors/app_colors.dart';
import 'package:yummly_app/core/styles/fonts/app_fonts.dart';

class DifficultyRow extends StatelessWidget {
  const DifficultyRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Difficulty",
          style: AppFonts.font18BlackWeight500,
        ),
        Container(
            decoration: BoxDecoration(
              color: AppColors.kBaseColor.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownMenu<int>(
              menuStyle: MenuStyle(
                surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
                side: WidgetStateProperty.all(
                  BorderSide.none,
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 0, label: "Easy"),
                DropdownMenuEntry(value: 1, label: "Medium"),
                DropdownMenuEntry(value: 2, label: "hard"),
                DropdownMenuEntry(value: 3, label: "Professional"),
              ],
            ))
      ],
    );
  }
}
