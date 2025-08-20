import 'package:bai_serve_customer/component/button/common_gradient_button.dart';
import 'package:bai_serve_customer/component/image/image_picker/common_image_picker.dart';
import 'package:bai_serve_customer/component/text_field/common_date_input_text_field.dart';
import 'package:bai_serve_customer/component/text_field/input_helper.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

import '../../../component/text/common_text.dart';
import '../../../component/text_field/common_text_field.dart';
import '../../../config/languages/cubit/language_cubit.dart';
import 'already_accunt_rich_text.dart';

class SignUpAllField extends StatelessWidget {
  const SignUpAllField({required this.formKey, super.key});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.height,
            //upload image
            const CommonImagePicker(width: 150, height: 150, borderRadius: 150, pickerIcon: Icons.person).center,
            10.height,
            CommonText(
              text: AppString.profilePhoto,
              style: getTheme.textTheme.titleMedium,
              alignment: MainAxisAlignment.center,
            ).center,

            /// User Name here
            CommonText(text: AppString.fullName, bottom: 8, top: 12),
            CommonTextField(hintText: AppString.fullName, validationType: ValidationType.validateFullName),

            /// User Phone here
            CommonText(text: AppString.phoneNumber, bottom: 8, top: 12),
            CommonTextField(
              isReadOnly: true,
              hintText: AppString.phoneNumber,
              validationType: ValidationType.validatePhone,
            ),

            ///Date of Birth here
            CommonText(text: AppString.dateOfBirth, bottom: 8, top: 12),
            CommonDateInputTextField(onSave: (date) {}),
            //role related info
            CommonText(text: AppString.address, bottom: 8, top: 12),
            CommonTextField(hintText: AppString.address, validationType: ValidationType.validateRequired),

            /// User Password here
            CommonText(text: AppString.newPassword, bottom: 8, top: 12),
            CommonTextField(validationType: ValidationType.validatePassword, hintText: AppString.newPassword),

            /// User Confirm Password here
            CommonText(text: AppString.confirmPassword, bottom: 8, top: 12),
            CommonTextField(
              hintText: AppString.confirmPassword,
              validationType: ValidationType.validateConfirmPassword,
              originalPassword: 'orginal password here',
            ),
            // All Text Filed here
            30.height,

            // Submit Button Here
            CommonGradientButton(
              titleText: AppString.signUp,
              onTap: () {
                //on success
                if (formKey.currentState!.validate()) {
                  appRouter.popUntilRouteWithName(SignInRoute.name);
                }

                //remove it on release
                appRouter.popUntilRouteWithName(SignInRoute.name);
              },
              buttonWidth: 132,
              buttonHeight: 40,
              isLoading: false,
            ).center,
            30.height,

            ///  Sign In Instruction here
            const AlreadyAccountRichText().center,
            40.height,
          ],
        ),
      ),
    );
  }
}
