import 'package:bai_serve/component/button/common_gradient_button.dart';
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/auth/controllers/otp_controller.dart';
import 'package:bai_serve/features/auth/widgets/already_accunt_rich_text.dart';
import 'package:bai_serve/features/auth/widgets/common_logo.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../component/text/common_text.dart';
import '../../../../../utils/constants/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../utils/constants/app_string.dart';

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
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// instruction how to get OTP
                  Spacer(),
                  CommonLogo().center,
                  50.height,
                  Center(
                    child: CommonText(
                      text: AppString.enterVerifyCode,
                      style: theme.textTheme.bodyLarge,
                    ),
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
                        controller.verifyOtpRepo(AppRoutes.signUp);
                      }
                    },
                  ),

                  182.height,

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

  Align _resendOtpTimerBuilder(OtpController controller) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap:
            controller.time == '00:00'
                ? () {
                  controller.startTimer();
                }
                : () {},
        child:
            controller.time == '00:00'
                ? CommonText(text: AppString.resendCode)
                : CommonText(
                  text:
                      "${AppString.resendCodeIn} ${controller.time} ${AppString.minute}",
                ),
      ),
    );
  }

  Flexible _otpBuilder(OtpController controller, BuildContext context) {
    return Flexible(
      flex: 0,
      child: PinCodeTextField(
        controller: controller.otpController,
        autoDisposeControllers: false,

        cursorColor: theme.textSelectionTheme.cursorColor,
        textStyle: theme.textTheme.bodyMedium?.copyWith(
          fontSize: 25,
          color: theme.inputDecorationTheme.enabledBorder?.borderSide.color,
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
          selectedColor: theme.primaryColor,
          activeColor: theme.primaryColor,
          inactiveColor: theme.colorScheme.outline,
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
