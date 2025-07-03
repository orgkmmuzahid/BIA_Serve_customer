import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_untitled/component/text/common_text.dart';
import 'package:new_untitled/config/route/app_routes.dart';
import 'package:new_untitled/features/auth/widgets/common_logo.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import 'package:new_untitled/utils/constants/app_string.dart';
import '../../../../utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_images.dart';
import '../../component/button/common_button.dart';
import '../../component/image/common_image.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            180.height,
            const Center(child: CommonLogo()),
            50.height,
            CommonText(
              text: AppString.selectYourLanguage,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ).center,
            10.height,
            CommonButton(
              titleText: "English",
              buttonColor: AppColors.transparent,
              titleColor: Color.fromRGBO(51, 51, 51, 1),
              borderColor: Color.fromRGBO(191, 191, 191, 1),
              Icon: Padding(
                padding: EdgeInsetsGeometry.only(right: 17.9),
                child: CommonImage(imageSrc: AppImages.langEnglish, size: 24),
              ),
              onTap: () => Get.toNamed(AppRoutes.loginWith),
            ),
            18.height,

            CommonButton(
              titleText: "Swahili",
              buttonColor: AppColors.transparent,
              titleColor: Color.fromRGBO(51, 51, 51, 1),
              borderColor: Color.fromRGBO(191, 191, 191, 1),
              Icon: Padding(
                padding: EdgeInsetsGeometry.only(right: 17.9),
                child: CommonImage(imageSrc: AppImages.langSwahili, size: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
