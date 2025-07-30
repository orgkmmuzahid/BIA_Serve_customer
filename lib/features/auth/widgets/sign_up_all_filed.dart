import 'package:bai_serve_customer/component/text_field/common_date_input_text_field.dart';
import 'package:bai_serve_customer/features/auth/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/app_string.dart';
import '../../../../utils/helpers/other_helper.dart';
import '../../../component/text/common_text.dart';
import '../../../component/text_field/common_text_field.dart';
import '../controllers/sign_up_controller.dart';

class SignUpAllField extends StatelessWidget {
  const SignUpAllField({
    required this.controller,
    required this.formKey,
    super.key,
  });

  final SignUpController controller;

  final Key formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// User Name here
          const CommonText(text: AppString.fullName, bottom: 8, top: 12),
          CommonTextField(
            hintText: AppString.fullName,
            controller: controller.nameController,
            validator: OtherHelper.validator,
          ),

          /// User Phone here
          const CommonText(text: AppString.phoneNumber, bottom: 8, top: 12),
          CommonTextField(
            isReadOnly: true,
            controller: Get.find<OtpController>().phoneController,
            hintText: AppString.phoneNumber,
            validator: OtherHelper.phoneValidator,
          ),

          ///Date of Birth here
          const CommonText(text: AppString.dateOfBirth, bottom: 8, top: 12),
          CommonDateInputTextField(onSave: (date) {}),

          /// User Password here
          const CommonText(text: AppString.newPassword, bottom: 8, top: 12),
          CommonTextField(
            controller: controller.passwordController,
            isPassword: true,
            hintText: AppString.newPassword,
            validator: OtherHelper.passwordValidator,
          ),

          /// User Confirm Password here
          const CommonText(text: AppString.confirmPassword, bottom: 8, top: 12),
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
        ],
      ),
    );
  }
}
