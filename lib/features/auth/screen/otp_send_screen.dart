import 'package:bai_serve/features/auth/controllers/otp_controller.dart';
import 'package:bai_serve/features/auth/widgets/already_accunt_rich_text.dart';
import 'package:bai_serve/features/auth/widgets/otp_send.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class OtpSendScreen extends StatelessWidget {
  const OtpSendScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: GetBuilder<OtpController>(
      builder:
          (controller) => Column(
            children: [
              const Spacer(),
              OtpSend(
                title:
                    controller.otpFor == OtpFor.signup
                        ? AppString.otpTitleSignup
                        : AppString.otpTitleForgetPass,

                subtitle:
                    controller.otpFor == OtpFor.signup
                        ? AppString.otpSubtitleSignup
                        : AppString.otpSubTitleForgetPass,
                controller: controller,
              ),

              const Spacer(),

              ///  Sign In Instruction here
              const AlreadyAccountRichText(),
              85.height,
            ],
          ),
    ),
  );
}
