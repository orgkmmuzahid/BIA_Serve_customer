import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/component/button/common_gradient_button.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/component/text_field/common_text_field.dart';
import 'package:bai_serve_customer/component/text_field/input_helper.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/features/auth/widgets/common_logo.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({required this.formKey, super.key});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 58, right: 58),
        child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const CommonLogo().center,
                  50.height,

                  /// User Password here
                  CommonText(text: AppString.newPassword, bottom: 8, top: 12),
            CommonTextField(hintText: AppString.newPassword, validationType: ValidationType.validatePassword),

                  /// User Confirm Password here
                  CommonText(text: AppString.confirmPassword, bottom: 8, top: 12),
            CommonTextField(
                    hintText: AppString.confirmPassword,
              validationType: ValidationType.validateConfirmPassword,
              originalPassword: 'original pass',
                  ),
                  20.height,

                  /// Submit Button here
                  CommonGradientButton(
              titleText: AppString.save,
                    buttonWidth: 132,
                    buttonHeight: 40,
                    onTap: () {
                if (formKey.currentState!.validate()) {
                      }
              },
              isLoading: false,
                  ).center,

                  const Spacer(),
                ],
              ),
        
      ),
    ),
  );
}
