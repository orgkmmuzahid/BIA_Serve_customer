import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/features/home/cubit/home_cubit.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigatorIconBuilderWidget extends StatelessWidget {
  const NavigatorIconBuilderWidget({
    required this.navIcon,
    required this.index,
    required this.currentPage,
    required this.cubit,
    super.key,
  });

  final MapEntry<String, String> navIcon;
  final int index;
  final int currentPage;
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = index == currentPage;

    final selectedIconBackgroundColor = getTheme.colorScheme.primary.withAlpha(30);
    final selectedIconIconColor = getTheme.colorScheme.primary;
    final unselectedColor = getTheme.textTheme.bodyMedium!.color;

    return GestureDetector(
      onTap: () {
        cubit.onNavigatinChange(index);
      },
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: isSelected ? 16.0 : 8.0, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? selectedIconBackgroundColor : Colors.transparent,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: isSelected ? 80 : 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonImage(
                imageSrc: navIcon.value,
                size: isSelected ? 24.0 : 20.0, // Larger size when selected
                imageColor: isSelected ? selectedIconIconColor : Colors.black54,
              ),
              CommonText(
                text: navIcon.key,
                style: getTheme.textTheme.bodyMedium?.copyWith(
                  color: isSelected ? selectedIconIconColor : unselectedColor,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                  fontSize: isSelected ? 14.0 : 12.0, // Bigger text when selected
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
