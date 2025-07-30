import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonBottomNavBar extends StatefulWidget {
  const CommonBottomNavBar({super.key, this.onTap, this.initialIndex = 0});
  final void Function(int index)? onTap;
  final int initialIndex;

  @override
  State<CommonBottomNavBar> createState() => _CommonBottomNavBarState();
}

class _CommonBottomNavBarState extends State<CommonBottomNavBar> {
  int selectedIndex = 0;

  final selectedIconBackgroundColor = getTheme.colorScheme.primary;
  final selectedIconIconColor = getTheme.colorScheme.onSecondary;

  final unselectedColor = getTheme.textTheme.bodyMedium!.color;
  final unselectedBackgroundColor = getTheme.textTheme.bodyMedium!.color;

  final Map<String, String> iconList = {
    AppString.navHome: AppImages.navHome,
    AppString.navMyOrder: AppImages.navMyOrder,
    AppString.navTrackingOrder: AppImages.navTrackingOrder,
    AppString.navAccount: AppImages.navAccount,
  };

  @override
  void initState() {
    selectedIndex = widget.initialIndex;
    super.initState();
  }

  void _onItemTapped(int index) {
    onNavMenuChange(index);
    widget.onTap?.call(index);
  }

  void onNavMenuChange(int index) {
    if (index == selectedIndex) {
      return;
    }
    if (index == 0) {
      appRouter.popUntilRouteWithName(HomeRoute.name);
      selectedIndex = 0;
      setState(() {});
    } else if (index == 1) {
      _routeNav(MyOrderRoute(commonBottomNavBar: const CommonBottomNavBar(initialIndex: 1)));
    } else if (index == 2) {
      _routeNav(TrackingOrderRoute(commonBottomNavBar: const CommonBottomNavBar(initialIndex: 2)));
    } else if (index == 3) {
      _routeNav(SettingRoute(commonBottomNavBar: const CommonBottomNavBar(initialIndex: 3)));
    }
  }

  void _routeNav(PageRouteInfo page) {
    if (appRouter.current.name == HomeRoute.name) {
      appRouter.push(page);
    } else {
      appRouter.replace(page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
        decoration: BoxDecoration(
          color: getTheme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(iconList.length, (index) {
            return GestureDetector(
              onTap: () => _onItemTapped(index),
              child: _buildIcon(iconList.entries.elementAt(index), index),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildIcon(MapEntry<String, String> navIcon, int index) {
    final bool isSelected = index == selectedIndex;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(horizontal: isSelected ? 16.w : 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? selectedIconBackgroundColor : Colors.transparent,
        borderRadius: BorderRadius.circular(10.r),
        // boxShadow:
        //     isSelected
        //         ? [BoxShadow(color: selectedIconBackgroundColor, blurRadius: 8, offset: const Offset(0, 4))]
        //         : null,
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
            style: getTheme.textTheme.bodyMedium?.copyWith(
              color: isSelected ? selectedIconIconColor : unselectedColor,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
              fontSize: isSelected ? 14.sp : 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
