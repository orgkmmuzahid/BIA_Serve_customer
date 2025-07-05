import 'package:bai_serve/component/button/common_gradient_button.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/features/auth/controllers/forget_password_controller.dart';
import 'package:bai_serve/features/auth/widgets/common_logo.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:bai_serve/utils/helpers/other_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 58, right: 58),
        child: GetBuilder<ForgetPasswordController>(
          builder:
              (controller) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  CommonLogo().center,
                  50.height,

                  /// User Password here
                  const CommonText(
                    text: AppString.newPassword,
                    bottom: 8,
                    top: 12,
                  ),
                  CommonTextField(
                    controller: controller.passwordController,
                    isPassword: true,
                    hintText: AppString.newPassword,
                    validator: OtherHelper.passwordValidator,
                  ),

                  /// User Confirm Password here
                  const CommonText(
                    text: AppString.confirmPassword,
                    bottom: 8,
                    top: 12,
                  ),
                  CommonTextField(
                    controller: controller.confirmPasswordController,
                    isPassword: true,
                    hintText: AppString.confirmPassword,
                    validator:
                        (value) => OtherHelper.confirmPasswordValidator(
                          value,
                          controller.passwordController,
                        ),
                  ),
                  20.height,

                  /// Submit Button here
                  CommonGradientButton(
                    titleText: AppString.save,
                    isLoading: controller.isLoading,
                    buttonWidth: 132,
                    buttonHeight: 32,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        controller.resetPasswordRepo();
                      }
                    },
                  ).center,

                  const Spacer(),
                ],
              ),
        ),
      ),
    ),
  );
}
