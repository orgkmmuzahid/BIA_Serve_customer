import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../config/route/app_routes.dart';
import '../../../utils/log/app_log.dart';


class CommonBottomNavBar extends StatefulWidget {
  final int currentIndex;

  const CommonBottomNavBar({required this.currentIndex, super.key});

  @override
  State<CommonBottomNavBar> createState() => _CommonBottomNavBarState();
}

class _CommonBottomNavBarState extends State<CommonBottomNavBar> {
  final selectedIconBackgroundColor = theme.colorScheme.primary;
  final selectedIconIconColor = theme.colorScheme.onSecondary;
  
  final unselectedColor = theme.textTheme.bodyMedium!.color;
  final unselectedBackgroundColor = theme.textTheme.bodyMedium!.color;

  var bottomNavIndex = 0;
  Map<String, String> iconList = { //"title": "image url"
    AppString.navHome: AppImages.navHome,
    AppString.navMyOrder: AppImages.navMyOrder,
    AppString.navTrackingOrder: AppImages.navTrackingOrder,
    AppString.navAccount: AppImages.navAccount,
    };

  @override
  void initState() {
    
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                topRight: Radius.circular(20.r))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(iconList.length, (index) {
            print("index $index current index ${bottomNavIndex}");
            return GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                child: _buildIcon(iconList.entries.elementAt(index), index ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void onTap(int index) async {
      appLog(widget.currentIndex, source: "common bottombar");

    if (index == 0) {
      if (!(widget.currentIndex == 0)) {
        Get.toNamed(AppRoutes.home);
      }
    } else if (index == 1) {
      if (!(widget.currentIndex == 1)) {
        Get.toNamed(AppRoutes.notifications);
      }
    } else if (index == 2) {
      if (!(widget.currentIndex == 2)) {
        Get.toNamed(AppRoutes.chat);
      }
    } else if (index == 3) {
      if (!(widget.currentIndex == 3)) {
        Get.toNamed(AppRoutes.profile);
      }
    }
  }

  Widget _buildIcon(MapEntry<String, String> navIcon, int index){
    return Column(children: [
       CircleAvatar(
        backgroundColor: _isSelected(index)? selectedIconBackgroundColor : theme.scaffoldBackgroundColor,
        radius: 20,
        child: CommonImage(imageSrc: navIcon.value, size: 24, imageColor: _isSelected(index)? selectedIconIconColor : unselectedColor)),
       CommonText(text: navIcon.key, style: theme.textTheme.bodyMedium?.copyWith(color: _isSelected(index)? selectedIconBackgroundColor : unselectedColor , 
       fontSize: _isSelected(index) ? 12 : 10,
       fontWeight:_isSelected(index)? FontWeight.w700 : FontWeight.w400))    
    ],);
  }

  bool _isSelected(int index) => index == bottomNavIndex;
}
