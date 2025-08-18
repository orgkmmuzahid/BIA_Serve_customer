import 'dart:ui';

import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/component/common_bar/common_bottom_bar.dart';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/pop_up/common_alert.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/auth/widgets/delete_account_alert.dart';
import 'package:bai_serve_customer/features/home/controller/home_controller.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({required this.userName, required this.address, required this.controller, super.key});
  final String userName;
  final String address;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Drawer(
        shape: const RoundedRectangleBorder(),
        child: Column(
          children: [
            // Drawer Header
            DrawerHeader(
            decoration: BoxDecoration(color: getTheme.primaryColor),
            child: SizedBox(
              height: 146,
                child: Row(
                children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          textAlign: TextAlign.start,
                          alignment: MainAxisAlignment.start,
                          text: userName,
                          style: getTheme.textTheme.bodyLarge?.copyWith(
                            color: getTheme.colorScheme.onPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        CommonText(
                          text: address,
                          textAlign: TextAlign.start,
                          alignment: MainAxisAlignment.start,
                          style: getTheme.textTheme.bodySmall?.copyWith(color: getTheme.colorScheme.onPrimary),
                        ),
                        10.height,
                      CommonButton(
                        titleText: AppString.viewProfile,
                        buttonWidth: 100,
                        buttonHeight: 30,
                        titleSize: 10,
                        titleColor: getTheme.colorScheme.onPrimary,
                        buttonRadius: 4,
                        borderColor: getTheme.colorScheme.onPrimary,
                        buttonColor: getTheme.colorScheme.primary,
                        onTap: () {
                          appRouter.pop();
                            // appRouter.push(SettingRoute(commonBottomNavBar: const CommonBottomNavBar()));
                        },
                        ),
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
              onTap: () => appRouter.push(const ReturnProductRoute()),
            ),
            _buildMenu(
              image: AppImages.drawerLoyaltyPoints,
              title: AppString.drawerLoyaltyPoints,
              onTap: () => appRouter.push(const LoyaltyPointsRoute()),
            ),
            _buildMenu(
              image: AppImages.myVendors,
              title: AppString.myVendors,
              onTap: () => appRouter.push(const MyVendorRoute()),
            ),
            _buildMenu(
              image: AppImages.drawerMessage,
              title: AppString.drawerMessage,
              onTap: () => appRouter.push(const MessageRoute()),
            ),
            _buildMenu(
              image: AppImages.drawerMyPayment,
              title: AppString.drawerMyPayment,
              onTap: () => appRouter.push(const MyPaymentRoute()),
            ),
            _buildMenu(
              image: AppImages.drawerSupport,
              title: AppString.drawerSupport,
              onTap: () => appRouter.push(ChatRoute()),
            ),
            _buildMenu(
              image: AppImages.drawerLanguage,
              title: AppString.drawerLanguage,
              onTap: () => appRouter.push(const LanguageRoute()),
            ),
            _buildMenu(
              image: AppImages.drawerDeleteAccount,
              title: AppString.drawerDeleteAccount,
              onTap: () {
                DeleteAccountAlert();
              },
            ),

            const Spacer(),
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
                  onTap: () {
                    //logout action.
                    appRouter.replace(const LoginOptionsRoute());
                  },
                );
              },
            ),
            50.height,
          ],
        ),
      ),
    );
  }

  ListTile _buildMenu({required String image, required String title, required Function() onTap, TextStyle? style}) {
    return ListTile(
      leading: CommonImage(imageSrc: image, size: 24, imageColor: AppColors.iconColorBlack),
      title: Text(title, style: style ?? getTheme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400)),
      onTap: () {
        appRouter.pop();
        onTap();
        // Handle logout logic
      },
    );
  }
}
