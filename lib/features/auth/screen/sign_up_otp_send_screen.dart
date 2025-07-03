import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:new_untitled/features/auth/controllers/otp_controller.dart';
import 'package:new_untitled/features/auth/widgets/already_accunt_rich_text.dart';
import 'package:new_untitled/features/auth/widgets/otp_send.dart';
import 'package:new_untitled/utils/constants/app_string.dart';
import 'package:new_untitled/utils/extensions/extension.dart';

class SignupOtpSendScreen extends StatelessWidget {
  const SignupOtpSendScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: GetBuilder<OtpController>(
      builder:
          (controller) => Column(
            children: [
              const Spacer(),
              OtpSend(
                title: AppString.otpTitleSignup,
                subtitle: AppString.otpSubtitleSignup,
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
