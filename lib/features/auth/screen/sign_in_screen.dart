import 'package:bai_serve/component/button/common_gradient_button.dart';
import 'package:bai_serve/features/auth/controllers/otp_controller.dart';
import 'package:bai_serve/features/auth/widgets/common_logo.dart';
import 'package:flutter/material.dart';
import '../../../../../config/route/app_routes.dart';
import '../../../../../utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../component/text/common_text.dart';
import '../../../component/text_field/common_text_field.dart';
import '../controllers/sign_in_controller.dart';

import '../../../../../utils/constants/app_string.dart';
import '../../../../../utils/helpers/other_helper.dart';
import '../widgets/do_not_account.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Sections Starts here
      appBar: AppBar(),

      /// Body Sections Starts here
      body: GetBuilder<SignInController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 58.w, vertical: 24.h),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Log In Instruction here
                  100.height,
                  const CommonLogo().center,
                  50.height,

                  /// Account Email Input here
                  const CommonText(
                    text: AppString.phoneNumber,
                    bottom: 8,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),

                  CommonTextField(
                    controller: controller.phoneController,
                    // prefixIcon: const Icon(Icons.mail),
                    // textStyle: theme.textTheme.bodyMedium,
                    hintText: AppString.phoneNumber,
                    validator: OtherHelper.phoneValidator,
                  ),

                  /// Account Password Input here
                  const CommonText(
                    text: AppString.password,
                    bottom: 8,
                    top: 24,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  CommonTextField(
                    controller: controller.passwordController,
                    // prefixIcon: const Icon(Icons.lock),
                    isPassword: true,
                    hintText: AppString.password,
                    validator: OtherHelper.passwordValidator,
                  ),

                  /// Forget Password Button here
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.find<OtpController>().changeOtpFor(
                          OtpFor.forgetPassword,
                        );
                        Get.toNamed(AppRoutes.otpSend);
                      },
                      child: const CommonText(
                        text: AppString.forgotThePassword,
                        top: 10,
                        bottom: 30,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  /// Submit Button here
                  Align(
                    alignment: Alignment.center,
                    child: CommonGradientButton(
                      titleText: AppString.signIn,
                      isLoading: controller.isLoading,
                      onTap: controller.signInUser,
                      buttonWidth: 132,
                      buttonHeight: 32,
                    ),
                  ),
                  142.height,

                  /// Account Creating Instruction here
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: const DoNotHaveAccount(),
                  ),
                  30.height,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
