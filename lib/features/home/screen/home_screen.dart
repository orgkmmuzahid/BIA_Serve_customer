import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/common/app_bar/common_app_bar.dart';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/features/home/controller/home_controller.dart';
import 'package:bai_serve_customer/features/home/widgets/home_content.dart';
import 'package:bai_serve_customer/features/home/widgets/home_drawer.dart';
import 'package:bai_serve_customer/features/order/my_order/screens/my_order_screen.dart';
import 'package:bai_serve_customer/features/order/tracking_order/screens/tracking_order_screen.dart';
import 'package:bai_serve_customer/features/setting/screens/setting_screen.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
    builder:
        (controller) => Scaffold(
          appBar: CommonAppBar(leading: _leading(), isCenterTitle: false, titleWidget: _title(controller)),
          drawer: HomeDrawer(userName: controller.name, address: controller.address, controller: controller),
          body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: IndexedStack(
              index: controller.selectedNavMenu,
              children: [
                HomeContent(homeController: controller),
                MyOrderScreen(),
                const TrackingOrderScreen(),
                const SettingScreen(),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            padding: const EdgeInsets.symmetric(vertical: 2),
            notchMargin: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIcon(MapEntry(AppString.navHome, AppImages.navHome), 0, controller),
                _buildIcon(MapEntry(AppString.navMyOrder, AppImages.navMyOrder), 1, controller),
                _buildIcon(MapEntry(AppString.navTrackingOrder, AppImages.navTrackingOrder), 2, controller),
                _buildIcon(MapEntry(AppString.navAccount, AppImages.navAccount), 3, controller),
              ],
            ),
          ),
        ),
  );

  Column _title(HomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(controller.name, style: getTheme.textTheme.titleMedium?.copyWith(color: getTheme.primaryColor)),
        Text(controller.address, style: getTheme.textTheme.bodyMedium),
      ],
    );
  }

  Builder _leading() {
    return Builder(
      builder:
          (context) => IconButton(
            icon: Icon(Icons.menu, color: getTheme.textTheme.bodyMedium?.color),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
    );
  }

  Widget _buildIcon(MapEntry<String, String> navIcon, int index, HomeController controller) {
    final bool isSelected = index == controller.selectedNavMenu;

    final selectedIconBackgroundColor = getTheme.colorScheme.primary.withAlpha(30);
    final selectedIconIconColor = getTheme.colorScheme.primary;
    final unselectedColor = getTheme.textTheme.bodyMedium!.color;

    return GestureDetector(
      onTap: () {
        controller.onNavigationChange(index);
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
