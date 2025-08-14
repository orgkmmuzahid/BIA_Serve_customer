import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/component/button/common_gradient_button.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/component/text_field/common_text_field.dart';
import 'package:bai_serve_customer/features/auth/controllers/forget_password_controller.dart';
import 'package:bai_serve_customer/features/auth/widgets/common_logo.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:bai_serve_customer/utils/helpers/other_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@RoutePage()
class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 58, right: 58),
        child: GetBuilder<ForgetPasswordController>(
          builder:
              (controller) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const CommonLogo().center,
                  50.height,

                  /// User Password here
                  CommonText(text: AppString.newPassword, bottom: 8, top: 12),
                  CommonTextField(
                    controller: controller.passwordController,
                    isPassword: true,
                    hintText: AppString.newPassword,
                    validator: OtherHelper.passwordValidator,
                  ),

                  /// User Confirm Password here
                  CommonText(text: AppString.confirmPassword, bottom: 8, top: 12),
                  CommonTextField(
                    controller: controller.confirmPasswordController,
                    isPassword: true,
                    hintText: AppString.confirmPassword,
                    validator: (value) => OtherHelper.confirmPasswordValidator(value, controller.passwordController),
                  ),
                  20.height,

                  /// Submit Button here
                  CommonGradientButton(
                    titleText: AppString.save,
                    isLoading: controller.isLoading,
                    buttonWidth: 132,
                    buttonHeight: 40,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
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
