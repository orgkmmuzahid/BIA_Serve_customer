import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonDateInputTextField extends StatelessWidget {
  final TextEditingController controller;
  final Color? fillColor;
  final Color? labelTextColor;
  final Color? hintTextColor;
  final Color? textColor;
  final Color borderColor;
  final double paddingHorizontal;
  final double paddingVertical;
  final double borderRadius;

  const CommonDateInputTextField({
    super.key,
    required this.controller,
    this.fillColor = AppColors.filledColor,
    this.hintTextColor = AppColors.textFiledColor,
    this.labelTextColor = AppColors.textFiledColor,
    this.textColor = AppColors.black,
    this.borderColor = AppColors.textFiledBorder,
    this.paddingHorizontal = 16,
    this.paddingVertical = 14,
    this.borderRadius = 10,
  });

  Future<void> _openDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.value = TextEditingValue(
        text: "${picked.toLocal()}".split(' ')[0],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: false,
      style: TextStyle(fontSize: 14, color: textColor),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal.w,
          vertical: paddingVertical.h,
        ),
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
        disabledBorder: _buildBorder(),
        errorBorder: _buildBorder(),
        fillColor: fillColor,
        hintStyle: GoogleFonts.dmSans(fontSize: 14, color: hintTextColor),
        labelStyle: GoogleFonts.dmSans(fontSize: 14, color: labelTextColor),
        hintText: 'YYYY-MM-DD',
        suffixIcon: IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () => _openDatePicker(context),
        ),
      ),
      controller: controller,
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius.r),
      borderSide: BorderSide(color: borderColor),
    );
  }
}
