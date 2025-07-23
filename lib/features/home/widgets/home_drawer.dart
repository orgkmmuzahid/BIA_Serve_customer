import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/pop_up/common_alert.dart';
import 'package:bai_serve/features/auth/widgets/delete_account_alert.dart';
import 'package:bai_serve/features/home/controller/home_controller.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    required this.userName,
    required this.address,
    required this.controller,
    super.key,
  });
  final String userName;
  final String address;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(),
      child: Column(
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: BoxDecoration(color: getTheme.primaryColor),
            child: SizedBox(
              height: 146,
              child: ListView(
                children: [
                  Text(
                    userName,
                    style: getTheme.textTheme.bodyLarge?.copyWith(
                      color: getTheme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    address,
                    style: getTheme.textTheme.bodySmall?.copyWith(
                      color: getTheme.colorScheme.onPrimary,
                    ),
                  ),
                  10.height,
                  Row(
                    children: [
                      CommonButton(
                        titleText: AppString.viewProfile,
                        buttonWidth: 90,
                        buttonHeight: 24,
                        titleSize: 10,
                        titleColor: getTheme.colorScheme.onPrimary,
                        buttonRadius: 4,
                        borderColor: getTheme.colorScheme.onPrimary,
                        buttonColor: getTheme.colorScheme.primary,
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Drawer Items
          _buildMenu(
            image: AppImages.drawerReturnProduct,
            title: AppString.drawerReturnsProduct,
            onTap: controller.onDrawerReturnProduct,
          ),
          _buildMenu(
            image: AppImages.drawerLoyaltyPoints,
            title: AppString.drawerLoyaltyPoints,
            onTap: controller.onDrawerLoyaltyPoints,
          ),
          _buildMenu(
            image: AppImages.drawerMessage,
            title: AppString.drawerMessage,
            onTap: controller.onDrawerMessage,
          ),
          _buildMenu(
            image: AppImages.drawerMyPayment,
            title: AppString.drawerMyPayment,
            onTap: controller.onDrawerMyPayment,
          ),
          _buildMenu(
            image: AppImages.drawerSupport,
            title: AppString.drawerSupport,
            onTap: controller.onDrawerSupport,
          ),
          _buildMenu(
            image: AppImages.drawerLanguage,
            title: AppString.drawerLanguage,
            onTap: controller.onDrawerLanguage,
          ),
          _buildMenu(
            image: AppImages.drawerDeleteAccount,
            title: AppString.drawerDeleteAccount,
            onTap: () {
              DeleteAccountAlert();
            },
          ),

          const SizedBox(height: 218),
          _buildMenu(
            image: AppImages.drawerLogout,
            title: AppString.logOut,
            style: getTheme.textTheme.labelMedium?.copyWith(
              color: getTheme.colorScheme.error,
              fontWeight: FontWeight.w400,
            ),
            onTap: () {
              CommonAlert(
                title: AppString.logoutMessage,
                onTap: controller.onDrawerLogout,
              );
            },
          ),
        ],
      ),
    );
  }

  ListTile _buildMenu({
    required String image,
    required String title,
    required Function() onTap,
    TextStyle? style,
  }) {
    return ListTile(
      leading: CommonImage(imageSrc: image, size: 24),
      title: Text(
        title,
        style:
            style ??
            getTheme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400),
      ),
      onTap: () {
        Navigator.pop(Get.context!);
        onTap();
        // Handle logout logic
      },
    );
  }
}
