import 'package:bai_serve/component/app_bar_actions.dart';
import 'package:bai_serve/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:bai_serve/features/home/controller/home_controller.dart';
import 'package:bai_serve/features/home/widgets/home_content.dart';
import 'package:bai_serve/features/home/widgets/home_drawer.dart';
import 'package:bai_serve/features/notifications/presentation/controller/notifications_controller.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
    builder:
        (controller) => GetBuilder<NotificationsController>(
          builder: (notificationController) {
            return Scaffold(
              appBar: _appBar( notificationController , controller),
              drawer: HomeDrawer(
                userName: controller.name,
                address: controller.address, controller: controller,
              ),
              body: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: HomeContent(homeController: controller),
              ),
              bottomNavigationBar: CommonBottomNavBar(currentIndex: 0 ),
            );
          }
        ),
  );

 AppBar _appBar( NotificationsController notificationController, HomeController controller ) =>  AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      automaticallyImplyLeading: false,

      leading: Builder(
        builder:
            (context) => IconButton(
              icon: Icon(Icons.menu, color: theme.textTheme.bodyMedium?.color),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
      ),

      // 👤 User info
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           controller.name,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(controller.address, style: theme.textTheme.bodySmall),
        ],
      ),

      actions: AppBarActions(notificationCount: notificationController.totalUnreadNotification, slectedCountry: controller.selectedCountry, availableCountries: controller.availableCountries, onCountryChange: controller.onCountryChange, onNotificationTap: controller.onNotificationTap)
    );
}
