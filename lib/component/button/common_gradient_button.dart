import 'package:flutter/material.dart';
import 'package:new_untitled/component/button/common_button.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';

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
    decoration: BoxDecoration(gradient: AppColors.buttonGradient),
    child: CommonButton(
      titleText: titleText,
      onTap: onTap,
      titleSize: titleSize,
      titleWeight: titleWeight,
      isLoading: isLoading,
      buttonColor: AppColors.transparent,
      buttonRadius: 0,
      Icon: icon,
      buttonWidth: buttonWidth ?? double.infinity,
      buttonHeight: buttonHeight ?? 48,
      titleColor: titleColor,
    ),
  );
}
