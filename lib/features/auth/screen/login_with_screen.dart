import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/auth/controllers/login_with_controller.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginWithScreen extends StatelessWidget {
  const LoginWithScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: GetBuilder<LoginWithController>(
        builder:
            (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                180.height,
                const Center(
                  child: CommonImage(
                    imageSrc: AppImages.appsIcon,
                    width: 124,
                    height: 107,
                  ),
                ),
                50.height,
                leftAlignButton(
                  tilte: AppString.loginWithContactNumber,
                  image: AppImages.iconContact,
                  onTap: () => Get.toNamed(AppRoutes.signIn),
                ),
                20.height,
                leftAlignButton(
                  tilte: AppString.loginWithGoogle,
                  image: AppImages.iconGoogle,
                ),
                20.height,
                leftAlignButton(
                  tilte: AppString.loginWithFacebook,
                  image: AppImages.iconFacebook,
                ),
              ],
            ),
      ),
    ),
  );

  Widget leftAlignButton({
    required String tilte,
    required String image,
    VoidCallback? onTap,
  }) => CommonButton(
    titleText: tilte,
    onTap: onTap,
    titleSize: 12,
    titleWeight: FontWeight.w500,
    buttonColor: theme.scaffoldBackgroundColor,
    titleColor: theme.textTheme.bodyLarge!.color,
    borderColor: theme.colorScheme.outlineVariant,
    alignment: MainAxisAlignment.start,
    icon: Padding(
      padding: const EdgeInsets.only(left: 40.5, right: 20),
      child: CommonImage(imageSrc: image),
    ),
  );
}
