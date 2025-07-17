
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CommonLinerProgressStep extends StatelessWidget {
  final List<Widget> steps;
  final int currentStep;
  final Color activeColor;
  final Color inactiveColor;
  final double lineHeight;
  final double stepSize;
  final double lineWidth;

  const CommonLinerProgressStep({
    super.key,
    required this.steps,
    required this.currentStep,
    this.activeColor =  AppColors.success,
    this.inactiveColor = AppColors.disable,
    this.lineHeight = 4.0,
    this.stepSize = 35,
    this.lineWidth = 20
  });

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
              final isActive = stepIndex <= currentStep;
              return Expanded(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(color:  isActive ? activeColor : inactiveColor, 
                     borderRadius: BorderRadius.circular(stepSize)
                    ),
                    child: ColorFiltered(colorFilter: ColorFilter.mode( AppColors.serfeceBG, BlendMode.srcIn), 
                    child: steps[stepIndex],
                    ),
                  ),
                ),
              );
            } else {
              final isActive = (index ~/ 2) < currentStep;
              return Container(
                width: lineWidth,
                height: lineHeight,
                color: isActive ? activeColor : inactiveColor,
              );
            }
          }),
        ),
      ],
    );
  }
}
