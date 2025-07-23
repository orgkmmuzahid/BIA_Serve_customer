// File: setting_screen.dart
import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/common_bar/common_bottom_bar.dart';
import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/pop_up/common_alert.dart';
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/auth/widgets/delete_account_alert.dart';
import 'package:bai_serve/features/home/controller/home_controller.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// static const String setting = "/setting_screen.dart";
// GetPage(name: setting, page: () => const SettingScreen()),

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CommonAppBar(
      title: AppString.account,
      leading: SizedBox(width: 0, height: 0),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsGeometry.only(left: 16, right: 16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: BoxBorder.all(
                  width: 8,
                  color: AppColors.secondaryColor,
                ),
                shape: BoxShape.circle,
              ),
              child:
                  const CommonImage(
                    imageSrc: AppImages.homeBanner,
                    fill: BoxFit.fill,
                    borderRadius: 130,
                    width: 130,
                    height: 130,
                  ).center,
            ),
            10.height,
            Text('Cameron Williamson', style: getTheme.textTheme.bodyLarge),
            4.height,
            const Text(
              '+123456789',
              style: TextStyle(
                color: AppColors.secondaryText,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            10.height,

            _buildMenu(
              leading: const Icon(Icons.person_outline),
              title: AppString.changePersonalInfo,
              onTap: () {
                Get.toNamed(AppRoutes.profileInfo);
              },
            ),

            _buildMenu(
              leading: const Icon(Icons.payment),
              title: AppString.payment,
              onTap: Get.find<HomeController>().onDrawerMyPayment,
            ),

            _buildMenu(
              image: AppImages.drawerLanguage,
              title: AppString.drawerLanguage,
              onTap: () {
                Get.toNamed(AppRoutes.language);
              },
            ),
            _buildMenu(
              image: AppImages.drawerSupport,
              title: AppString.drawerSupport,
              onTap: Get.find<HomeController>().onDrawerSupport,
            ),

            _buildMenu(
              leading: const Icon(Icons.privacy_tip_outlined),
              title: AppString.privacyPolicy,
              onTap: () {
                Get.toNamed(AppRoutes.privacyPolicy);
              },
            ),

            _buildMenu(
              leading: const Icon(Icons.library_books_outlined),
              title: AppString.termsCondition,
              onTap: () {
                Get.toNamed(AppRoutes.termsCondition);
              },
            ),

            _buildMenu(
              image: AppImages.drawerDeleteAccount,
              title: AppString.drawerDeleteAccount,
              onTap: () {
                DeleteAccountAlert();
              },
            ),

            const SizedBox(height: 50),
            _buildMenu(
              image: AppImages.drawerLogout,
              enableTrailing: false,
              title: AppString.logOut,
              onTap: () {
                CommonAlert(
                  title: AppString.logoutMessage,
                  onTap: Get.find<HomeController>().onDrawerLogout,
                );
              },
            ),
          ],
        ),
      ),
    ),
    bottomNavigationBar: const CommonBottomNavBar(),
  );

  ListTile _buildMenu({
    required String title,
    required Function() onTap,
    String? image,
    Widget? leading,
    bool enableTrailing = true,
  }) {
    return ListTile(
      leading: leading ?? CommonImage(imageSrc: image!, size: 24),
      trailing: enableTrailing ? const Icon(Icons.arrow_forward_ios) : null,
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      onTap: () {
        onTap();
        // Handle logout logic
      },
    );
  }
}
