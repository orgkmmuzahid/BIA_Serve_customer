import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_untitled/config/route/app_routes.dart';
import 'package:new_untitled/features/auth/controllers/otp_controller.dart';
import '../../../component/button/common_button.dart';
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
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  /// instruction how to get OTP
                  Center(
                    child: CommonText(
                      text:
                          "${AppString.codeHasBeenSendTo} ${controller.phoneController.text}",
                      fontSize: 18,
                      top: 100,
                      bottom: 60,
                      maxLines: 3,
                    ),
                  ),

                  /// OTP Filed here
                  Flexible(
                    flex: 0,
                    child: PinCodeTextField(
                      controller: controller.otpController,
                      autoDisposeControllers: false,
                      cursorColor: AppColors.black,
                      appContext: (context),
                      autoFocus: true,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(16.r),
                        fieldHeight: 60.h,
                        fieldWidth: 60.w,
                        activeFillColor: AppColors.transparent,
                        selectedFillColor: AppColors.transparent,
                        inactiveFillColor: AppColors.transparent,
                        borderWidth: 0.5.w,
                        selectedColor: AppColors.primaryColor,
                        activeColor: AppColors.primaryColor,
                        inactiveColor: AppColors.black,
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
                  ),

                  /// Resent OTP or show Timer
                  GestureDetector(
                    onTap:
                        controller.time == '00:00'
                            ? () {
                              controller.startTimer();
                            }
                            : () {},
                    child: CommonText(
                      text:
                          controller.time == '00:00'
                              ? AppString.resendCode
                              : "${AppString.resendCodeIn} ${controller.time} ${AppString.minute}",
                      top: 60,
                      bottom: 100,
                      fontSize: 18,
                    ),
                  ),

                  ///  Submit Button here
                  CommonButton(
                    titleText: AppString.verify,
                    isLoading: controller.isLoadingVerify,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        controller.verifyOtpRepo(AppRoutes.signUp);
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
