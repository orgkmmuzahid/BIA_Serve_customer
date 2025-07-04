import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

class CommonGradientButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String titleText;
  final bool isLoading;
  final Widget? icon;
  final double? buttonHeight;
  final double? buttonWidth;
  final double titleSize;
  final FontWeight titleWeight;
  final Color titleColor;

  const CommonGradientButton({
    super.key,
    this.onTap,
    required this.titleText,
    required this.isLoading,
    this.icon,
    this.buttonHeight,
    this.buttonWidth,
    this.titleSize = 16,
    this.titleWeight = FontWeight.w700,
    this.titleColor = AppColors.white,
  });
  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xff034045), theme.colorScheme.primary],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.circular(04),
    ),
    child: CommonButton(
      titleText: titleText,
      onTap: onTap,
      titleSize: titleSize,
      titleWeight: titleWeight,
      isLoading: isLoading,
      buttonRadius: 0,
      icon: icon,
      buttonColor: Colors.transparent,
      buttonWidth: buttonWidth ?? double.infinity,
      buttonHeight: buttonHeight ?? 48,
      titleColor: titleColor,
    ),
  );
}
