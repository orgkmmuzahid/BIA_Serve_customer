import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/features/home/controller/home_controller.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonBottomNavBar extends StatefulWidget {
  const CommonBottomNavBar({super.key});

  @override
  State<CommonBottomNavBar> createState() => _CommonBottomNavBarState();
}

class _CommonBottomNavBarState extends State<CommonBottomNavBar> {
  final selectedIconBackgroundColor = theme.colorScheme.primary;
  final selectedIconIconColor = theme.colorScheme.onSecondary;

  final unselectedColor = theme.textTheme.bodyMedium!.color;
  final unselectedBackgroundColor = theme.textTheme.bodyMedium!.color;

  Map<String, String> iconList = {
    //"title": "image url"
    AppString.navHome: AppImages.navHome,
    AppString.navMyOrder: AppImages.navMyOrder,
    AppString.navTrackingOrder: AppImages.navTrackingOrder,
    AppString.navAccount: AppImages.navAccount,
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(iconList.length, (index) {
                return GestureDetector(
                  onTap: () {
                    homeController.onNavMenuChange(index);
                  },
                  child: Container(
                    child: _buildIcon(
                      iconList.entries.elementAt(index),
                      index,
                      homeController,
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
Widget _buildIcon(
    MapEntry<String, String> navIcon,
    int index,
    HomeController controller,
  ) {
    final bool isSelected = _isSelected(index, controller);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(
        horizontal: isSelected ? 16.w : 8.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: isSelected ? selectedIconBackgroundColor: Colors.transparent,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: selectedIconBackgroundColor,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonImage(
            imageSrc: navIcon.value,
            size: 28,
            imageColor: isSelected ? selectedIconIconColor : AppColors.iconColorBlack,
          ),
          SizedBox(height: 4.h),
          CommonText(
            text: navIcon.key,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isSelected ? selectedIconIconColor : unselectedColor,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
              fontSize: isSelected ? 14.sp : 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  bool _isSelected(int index, HomeController controller) =>
      index == controller.selectedNavMenu;
}
