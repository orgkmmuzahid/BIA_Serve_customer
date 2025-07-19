import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/features/home/controller/home_controller.dart';
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
            padding: EdgeInsets.all(12.sp),
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
    return Column(
      children: [
        CircleAvatar(
          backgroundColor:
              _isSelected(index, controller)
                  ? selectedIconBackgroundColor
                  : theme.scaffoldBackgroundColor,
          radius: 20,
          child: CommonImage(
            imageSrc: navIcon.value,
            size: 24,
            imageColor:
                _isSelected(index, controller)
                    ? selectedIconIconColor
                    : unselectedColor,
          ),
        ),
        CommonText(
          text: navIcon.key,
          style: theme.textTheme.bodyMedium?.copyWith(
            color:
                _isSelected(index, controller)
                    ? selectedIconBackgroundColor
                    : unselectedColor,
            fontSize: _isSelected(index, controller) ? 12 : 10,
            fontWeight:
                _isSelected(index, controller)
                    ? FontWeight.w700
                    : FontWeight.w400,
          ),
        ),
      ],
    );
  }

  bool _isSelected(int index, HomeController controller) =>
      index == controller.selectedNavMenu;
}
