import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/component/button/common_gradient_button.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/auth/controllers/otp_controller.dart';
import 'package:bai_serve_customer/features/auth/widgets/common_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../config/languages/cubit/language_cubit.dart';
import '../../../../../utils/extensions/extension.dart';
import '../../../../../utils/helpers/other_helper.dart';
import '../../../component/text/common_text.dart';
import '../../../component/text_field/common_text_field.dart';
import '../controllers/sign_in_controller.dart';
import '../widgets/do_not_account.dart';

@RoutePage()
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Log In Instruction here
                  60.height,
                  const CommonLogo().center,
                  50.height,

                  /// Account Email Input here
                  CommonText(text: AppString.phoneNumber, bottom: 8),

                  CommonTextField(
                    controller: controller.phoneController,
                    // prefixIcon: const Icon(Icons.mail),
                    // textStyle: theme.textTheme.bodyMedium,
                    hintText: AppString.phoneNumber,
                    validator: OtherHelper.phoneValidator,
                  ),

                  /// Account Password Input here
                  CommonText(text: AppString.password, bottom: 8, top: 24),
                  CommonTextField(
                    controller: controller.passwordController,
                    // prefixIcon: const Icon(Icons.lock),
                    isPassword: true,
                    hintText: AppString.password,
                    validator: OtherHelper.passwordValidator,
                  ),

                  /// Forget Password Button here
                  GestureDetector(
                    onTap: () {
                      Get.find<OtpController>().changeOtpFor(OtpFor.forgetPassword);
                      appRouter.push(const OtpSendRoute());
                    },
                    child: CommonText(
                      text: AppString.forgotThePassword,
                      top: 10,
                      bottom: 30,
                    ),
                  ).end,

                  /// Submit Button here
                  Align(
                    child: CommonGradientButton(
                      titleText: AppString.signIn,
                      isLoading: controller.isLoading,
                      onTap: controller.signInUser,
                      buttonWidth: 132,
                      buttonHeight: 40,
                    ),
                  ),
                  100.height,

                  /// Account Creating Instruction here
                  const Align(alignment: Alignment.bottomCenter, child: DoNotHaveAccount()),
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
