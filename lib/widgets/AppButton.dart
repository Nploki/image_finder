import 'package:flutter/material.dart';
import 'package:image_search_assignment/utils/colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  final void Function() func;

  const AppButton(
      {super.key,
      required this.text,
      this.size = 16,
      this.fontWeight = FontWeight.w600,
      this.color = AppColors.accent,
      required this.func});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkBlue,
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 16,
          right: 25,
          left: 25,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
