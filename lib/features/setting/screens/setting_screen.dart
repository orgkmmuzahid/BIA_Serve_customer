// File: setting_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/common/app_bar/common_app_bar.dart';
import 'package:bai_serve_customer/component/common_bar/common_bottom_bar.dart';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/pop_up/common_alert.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/auth/cubit/auth_cubit.dart';
import 'package:bai_serve_customer/features/auth/widgets/delete_account_alert.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CommonAppBar(title: AppString.account, leading: const SizedBox(width: 0, height: 0)),
    body: SingleChildScrollView(
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
              appRouter.push(
                ProfileInfoRoute(
                  formKey1: GlobalKey<FormState>(),
                  formKey2: GlobalKey<FormState>(),
                ),
              );
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
              final authCubit = context.read<AuthCubit>();
              CommonAlert(
                title: AppString.logoutMessage,
                onTap: () {
                  CommonAlert(
                    title: AppString.logoutMessage,
                    onTap: () {
                      //logout action.

                      authCubit.logout();
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    ),
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
