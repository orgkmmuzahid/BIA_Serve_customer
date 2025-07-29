// File: setting_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/common_bar/common_bottom_bar.dart';
import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/pop_up/common_alert.dart';
import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
import 'package:bai_serve/features/auth/widgets/delete_account_alert.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingScreen extends StatelessWidget {
  const SettingScreen({required this.commonBottomNavBar, super.key});
  final CommonBottomNavBar commonBottomNavBar;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CommonAppBar(title: AppString.account, leading: SizedBox(width: 0, height: 0)),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsGeometry.only(left: 16, right: 16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: BoxBorder.all(width: 8, color: AppColors.secondaryColor),
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
              style: TextStyle(color: AppColors.secondaryText, fontSize: 16, fontWeight: FontWeight.w700),
            ),
            10.height,

            _buildMenu(
              leading: const Icon(Icons.person_outline),
              title: AppString.changePersonalInfo,
              onTap: () {
                appRouter.push(const ProfileInfoRoute());
              },
            ),

            _buildMenu(
              leading: const Icon(Icons.payment),
              title: AppString.payment,
              onTap: () => appRouter.push(const MyPaymentRoute()),
            ),

            _buildMenu(
              image: AppImages.drawerLanguage,
              title: AppString.drawerLanguage,
              onTap: () => appRouter.push(const LanguageRoute()),
            ),
            _buildMenu(
              image: AppImages.drawerSupport,
              title: AppString.drawerSupport,
              onTap: () => appRouter.push(ChatRoute()),
            ),

            _buildMenu(
              leading: const Icon(Icons.privacy_tip_outlined),
              title: AppString.privacyPolicy,
              onTap: () => appRouter.push(const PrivacyPolicyRoute()),
            ),

            _buildMenu(
              leading: const Icon(Icons.library_books_outlined),
              title: AppString.termsCondition,
              onTap: () => appRouter.push(const TermsConditionRoute()),
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
                  onTap: () {
                    CommonAlert(
                      title: AppString.logoutMessage,
                      onTap: () {
                        //logout action.
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    ),
    bottomNavigationBar: commonBottomNavBar,
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
      title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
      onTap: () {
        onTap();
        // Handle logout logic
      },
    );
  }
}
