import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:new_untitled/component/button/common_gradient_button.dart';
import 'package:new_untitled/component/image/common_image.dart';
import 'package:new_untitled/component/text/common_text.dart';
import 'package:new_untitled/component/text_field/common_text_field.dart';
import 'package:new_untitled/config/route/app_routes.dart';
import 'package:new_untitled/features/auth/controllers/otp_controller.dart';
import 'package:new_untitled/features/auth/widgets/common_logo.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';
import 'package:new_untitled/utils/constants/app_images.dart';
import 'package:new_untitled/utils/constants/app_string.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

class OtpSend extends StatelessWidget {
  const OtpSend({
    super.key,
    this.title = "",
    this.subtitle = "",
    required this.controller,
  });
  final String title;
  final String subtitle;
  final OtpController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 58.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonLogo().center,
          50.height,
          CommonText(text: title, fontSize: 16, fontWeight: FontWeight.w600),
          CommonText(text: subtitle, fontSize: 12, fontWeight: FontWeight.w400),
          20.height,

          _phoneNumber(controller),

          12.height,

          CommonGradientButton(
            titleText: AppString.otpSendButton,
            isLoading: false,
            buttonWidth: 132,
            buttonHeight: 32,
            titleSize: 12,
            titleWeight: FontWeight.w500,
            onTap: () => Get.toNamed(AppRoutes.verifyUser),
          ),
        ],
      ),
    );
  }

  CommonTextField _phoneNumber(OtpController controller) {
    return CommonTextField(
      controller: controller.phoneController,
      prefixIcon: SizedBox(
        width: 46,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 46,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 0.5, color: AppColors.disableColor),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.only(right: 10, left: 10),
              child: CommonImage(imageSrc: AppImages.langEnglish, size: 25),
            ),
          ),
        ),
      ),
    );
  }
}
