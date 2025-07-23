import 'package:bai_serve/component/button/common_gradient_button.dart';
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/auth/controllers/otp_controller.dart';
import 'package:bai_serve/features/auth/widgets/already_accunt_rich_text.dart';
import 'package:bai_serve/features/auth/widgets/common_logo.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_string.dart';
import '../../../component/text/common_text.dart';

class VerifyUserScreen extends StatefulWidget {
  const VerifyUserScreen({super.key});

  @override
  State<VerifyUserScreen> createState() => _VerifyUserState();
}

class _VerifyUserState extends State<VerifyUserScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Get.find<OtpController>().startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Section starts here
      appBar: AppBar(
        title: const CommonText(
          text: AppString.otpVerify,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
      ),

      /// Body Section starts here
      body: GetBuilder<OtpController>(
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// instruction how to get OTP
                  const Spacer(),
                  const CommonLogo().center,
                  50.height,
                  CommonText(
                    alignment: MainAxisAlignment.center,
                    text: AppString.enterVerifyCode,
                    style: getTheme.textTheme.bodyLarge,
                  ),
                  20.height,

                  /// OTP Filed here
                  _otpBuilder(controller, context),
                  8.height,

                  /// Resent OTP or show Timer
                  _resendOtpTimerBuilder(controller),
                  28.height,

                  ///  Submit Button here
                  CommonGradientButton(
                    titleText: AppString.verify,
                    isLoading: controller.isLoadingVerify,
                    buttonWidth: 132,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        controller.verifyOtpRepo(
                          controller.otpFor == OtpFor.signup
                              ? AppRoutes.signUp
                              : AppRoutes.forgotPassword,
                        );
                      }
                    },
                  ),

                  const Spacer(),

                  ///  Sign In Instruction here
                  const AlreadyAccountRichText(),
                  85.height,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _resendOtpTimerBuilder(OtpController controller) {
    return controller.time == '00:00'
        ? _resendMessageBuilder(controller)
        : CommonText(
          alignment: MainAxisAlignment.end,
          text:
              '${AppString.resendCodeIn} ${controller.time} ${AppString.minute}',
        );
  }

  Widget _resendMessageBuilder(OtpController controller) => Align(
    alignment: Alignment.centerRight,
    child: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: AppString.didntReciveCode,
            style: GoogleFonts.dmSans(
              color: getTheme.textTheme.bodySmall?.color,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),

          /// Sign Up Button here
          TextSpan(
            text: ' ${AppString.resendCode}',
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    if (controller.time == '00:00') controller.startTimer();
                  },
            style: GoogleFonts.lato(
              color: getTheme.colorScheme.primary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    ),
  );

  Flexible _otpBuilder(OtpController controller, BuildContext context) {
    return Flexible(
      flex: 0,
      child: PinCodeTextField(
        controller: controller.otpController,
        autoDisposeControllers: false,

        cursorColor: getTheme.textSelectionTheme.cursorColor,
        textStyle: getTheme.textTheme.bodyMedium?.copyWith(
          fontSize: 25,
          color: getTheme.inputDecorationTheme.enabledBorder?.borderSide.color,
        ),
        appContext: (context),
        autoFocus: true,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(04),
          fieldHeight: 40,
          fieldWidth: 40,
          activeFillColor: AppColors.transparent,
          selectedFillColor: AppColors.transparent,
          inactiveFillColor: AppColors.transparent,
          borderWidth: 0.1,
          selectedColor: getTheme.primaryColor,
          activeColor: getTheme.primaryColor,
          inactiveColor: getTheme.colorScheme.outline,
        ),
        length: 6,
        keyboardType: TextInputType.number,
        autovalidateMode: AutovalidateMode.disabled,
        enableActiveFill: true,
        validator: (value) {
          if (value != null && value.length == 6) {
            return null;
          } else {
            return AppString.otpIsInValid;
          }
        },
      ),
    );
  }
}
