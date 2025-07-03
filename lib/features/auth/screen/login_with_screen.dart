import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/button/common_button.dart';
import 'package:new_untitled/component/image/common_image.dart';
import 'package:new_untitled/config/route/app_routes.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import 'package:new_untitled/utils/constants/app_images.dart';
import 'package:new_untitled/utils/constants/app_string.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

class LoginWithScreen extends StatelessWidget {
  const LoginWithScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.background,
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Column(
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
    buttonColor: AppColors.transparent,
    titleColor: Color.fromRGBO(51, 51, 51, 1),
    borderColor: Color.fromRGBO(191, 191, 191, 1),
    alignment: MainAxisAlignment.start,
    Icon: Padding(
      padding: EdgeInsets.only(left: 40.5, right: 20),
      child: CommonImage(imageSrc: image),
    ),
  );
}
