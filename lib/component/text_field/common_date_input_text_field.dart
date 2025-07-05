import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonDateInputTextField extends StatelessWidget {
  final TextEditingController controller;
  final Color? fillColor;
  final Color? labelTextColor;
  final Color? hintTextColor;
  final Color? textColor;
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
      style: theme.textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal.w,
          vertical: paddingVertical.h,
        ),
        fillColor: fillColor,
        hintText: 'YYYY-MM-DD',
        suffixIcon: IconButton(
          icon: Icon(
            Icons.calendar_month_outlined,
            color: theme.inputDecorationTheme.activeIndicatorBorder?.color,
          ),
          onPressed: () => _openDatePicker(context),
        ),
      ),
      controller: controller,
    );
  }
}
