import 'package:flutter/material.dart';
import 'package:yummly_app/core/styles/colors/app_colors.dart';
import 'package:yummly_app/core/styles/fonts/app_fonts.dart';

class InformationRow extends StatefulWidget {
  const InformationRow({
    super.key,
    required this.text,
  });
  final String text;

  @override
  State<InformationRow> createState() => _InformationRowState();
}

class _InformationRowState extends State<InformationRow> {
  int preparationTime = 20;
  void _incrementTime() {
    setState(() {
      preparationTime += 5;
    });
  }

  void _decrementTime() {
    setState(() {
      if (preparationTime > 0) preparationTime -= 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text,
          style: AppFonts.font18BlackWeight500,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          decoration: BoxDecoration(
            color: AppColors.kBaseColor.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _incrementTime,
                splashRadius: 20,
              ),
              Text(
                '${preparationTime}s',
                style: const TextStyle(fontSize: 18),
              ),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: _decrementTime,
                splashRadius: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
