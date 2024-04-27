import 'package:flutter/material.dart';
import 'package:image_search_assignment/utils/colors.dart';

class AppInputField extends StatelessWidget {
  final TextEditingController textController;
  final Color color;
  final double size;
  final FontWeight fontWeight;

  const AppInputField({
    super.key,
    this.color = AppColors.accent,
    this.size = 16,
    this.fontWeight = FontWeight.w600,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      cursorWidth: 2.2,
      cursorColor: AppColors.darkGreen,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.darkBlue,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: "Type Here ...",
        hintStyle: TextStyle(
          color: color.withOpacity(0.5),
          fontSize: size,
          fontWeight: fontWeight,
        ),
        helperText: "Search For Any Image",
        helperStyle: TextStyle(
          color: color.withOpacity(0.8),
          fontSize: 11,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
