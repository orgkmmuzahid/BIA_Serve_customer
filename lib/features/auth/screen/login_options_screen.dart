import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/auth/controllers/login_with_controller.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
@RoutePage()
class LoginOptionsScreen extends StatelessWidget {
  const LoginOptionsScreen({super.key});

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
                  onTap: () => appRouter.push(const SignInRoute()),
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
    buttonColor: getTheme.scaffoldBackgroundColor,
    titleColor: getTheme.textTheme.bodyLarge!.color,
    borderColor: getTheme.colorScheme.outlineVariant,
    alignment: MainAxisAlignment.start,
    icon: Padding(
      padding: const EdgeInsets.only(left: 40.5, right: 20),
      child: CommonImage(imageSrc: image),
    ),
  );
}
