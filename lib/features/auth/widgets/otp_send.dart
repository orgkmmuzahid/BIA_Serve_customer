import 'package:bai_serve_customer/component/button/common_gradient_button.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/component/text_field/common_phone_number_text_filed.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/auth/controllers/otp_controller.dart';
import 'package:bai_serve_customer/features/auth/widgets/common_logo.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OtpSend extends StatelessWidget {
  const OtpSend({
    required this.controller,
    super.key,
    this.title = '',
    this.subtitle = '',
  });
  final String title;
  final String subtitle;
  final OtpController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 58.w, vertical: 24.h),
      child: Column(
        children: [
          const CommonLogo().center,
          50.height,
          CommonText(
            text: title,
            style: getTheme.textTheme.bodyLarge,
            alignment: MainAxisAlignment.center,
          ),
          CommonText(
            text: subtitle,
            style: getTheme.textTheme.bodyMedium,
            alignment: MainAxisAlignment.center,
          ),
          20.height,
          CommonPhoneNumberTextFiled(
            controller: Get.find<OtpController>().phoneController,
            countryChange: (value) {},
          ),

          12.height,

          CommonGradientButton(
            titleText: AppString.otpSendButton,
            isLoading: false,
            buttonWidth: 140,
            buttonHeight: 32,
            titleSize: 12,
            titleWeight: FontWeight.w500,
            onTap: () => appRouter.push(const VerifyUserRoute()),
          ),
        ],
      ),
    );
  }

  // CommonTextField _phoneNumber(OtpController controller) {
  //   return CommonTextField(
  //     controller: controller.phoneController,
  //     prefixIcon: SizedBox(
  //       width: 46,
  //       child: Align(
  //         alignment: Alignment.centerLeft,
  //         child: Container(
  //           width: 46,
  //           decoration: BoxDecoration(
  //             border: Border(
  //               right: BorderSide(width: 0.5, color: AppColors.disableColor),
  //             ),
  //           ),
  //           child: Padding(
  //             padding: EdgeInsetsGeometry.only(right: 10, left: 10),
  //             child: CommonImage(imageSrc: AppImages.langEnglish, size: 25),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
