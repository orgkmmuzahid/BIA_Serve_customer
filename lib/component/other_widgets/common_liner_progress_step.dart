import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonLinerProgressStep extends StatelessWidget {
  const CommonLinerProgressStep({
    required this.steps,
    required this.currentStep,
    super.key,
    this.activeColor = AppColors.success,
    this.inactiveColor = AppColors.disable,
    this.lineHeight = 4.0,
    this.stepSize = 35,
    this.lineWidth = 20,
  });
  final List<Widget> steps;
  final int currentStep;
  final Color activeColor;
  final Color inactiveColor;
  final double lineHeight;
  final double stepSize;
  final double lineWidth;

  @override
  Widget build(BuildContext context) {
    final totalSteps = steps.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: List.generate(totalSteps * 2 - 1, (index) {
            final isStep = index.isEven;
            final stepIndex = index ~/ 2;

            if (isStep) {
              final isActive = stepIndex <= currentStep - 1;
              return Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: isActive ? activeColor : inactiveColor,
                      borderRadius: BorderRadius.circular(stepSize),
                    ),
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(AppColors.serfeceBG, BlendMode.srcIn),
                      child: steps[stepIndex],
                    ),
                  ),
                ),
              );
            } else {
              final isActive = (index ~/ 2) < currentStep - 1;
              return Container(width: lineWidth.w, height: lineHeight.h, color: isActive ? activeColor : inactiveColor);
            }
          }),
        ),
      ],
    );
  }
}
