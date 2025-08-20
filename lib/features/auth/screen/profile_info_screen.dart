import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/common/app_bar/common_app_bar.dart';
import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/component/common_bar/common_tab_bar.dart';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/component/text_field/common_date_input_text_field.dart';
import 'package:bai_serve_customer/component/text_field/common_text_field.dart';
import 'package:bai_serve_customer/component/text_field/input_helper.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({
    required this.formKey1,
    required this.formKey2,
    required this.ctrCurrentPass,
    required this.ctrNewPass,
    required this.ctrConfPass,
    super.key,
  });
  final GlobalKey<FormState> formKey1;
  final GlobalKey<FormState> formKey2;
  final TextEditingController ctrCurrentPass;
  final TextEditingController ctrNewPass;
  final TextEditingController ctrConfPass;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CommonAppBar(title: AppString.profileInfo),

    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: BoxBorder.all(width: 8, color: AppColors.secondaryColor),
                shape: BoxShape.circle,
              ),
              child:
                  const CommonImage(imageSrc: AppImages.homeBanner, borderRadius: 130, width: 130, height: 130).center,
            ),
            10.height,
            Text('Cameron Williamson', style: getTheme.textTheme.bodyLarge),
            10.height,
            CommonTabBar(
              tabs: [AppString.editProfile, AppString.changePassword],
              tabViews: [_profileChange(), _changePassowrd()],
            ),
          ],
        ),
      ),
    ),
  );

  Widget _changePassowrd() => Form(
    key: formKey1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        30.height,

        /// current Password section
        CommonText(text: AppString.currentPassword, bottom: 8),
        CommonTextField(
          controller: ctrCurrentPass,
          hintText: AppString.currentPassword,
          validationType: ValidationType.validatePassword,
          prefixIcon: Icon(Icons.lock, size: 20.sp),
        ),

        /// New Password section
        CommonText(text: AppString.newPassword, bottom: 8, top: 16),
        CommonTextField(
          controller: ctrNewPass,
          hintText: AppString.newPassword,
          validationType: ValidationType.validatePassword,
          prefixIcon: Icon(Icons.lock, size: 20.sp),
        ),

        /// confirm Password section
        CommonText(text: AppString.confirmPassword, bottom: 8, top: 16),
        CommonTextField(
          controller: ctrConfPass,
          hintText: AppString.confirmPassword,
          validationType: ValidationType.validateConfirmPassword,
          originalPassword: ctrNewPass.text,
          prefixIcon: Icon(Icons.lock, size: 20.sp),
        ),
        20.height,

        /// submit Button
        CommonButton(
          titleText: AppString.save,
          buttonWidth: 172,
          onTap: () {
            if (formKey1.currentState?.validate() == true) {
              formKey1.currentState?.save();
            }
          },
        ).center,
      ],
    ),
  );

  Form _profileChange() => Form(
    key: formKey2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        30.height,

        /// current Password section
        CommonText(text: AppString.fullName, bottom: 8),
        CommonTextField(
          hintText: AppString.fullName,
          validationType: ValidationType.validateFullName,
          prefixIcon: Icon(Icons.person, size: 20.sp),
        ),

        /// New Password section
        CommonText(text: AppString.phoneNumber, bottom: 8, top: 16),
        CommonTextField(
          hintText: AppString.phoneNumber,
          validationType: ValidationType.validatePhone,
          prefixIcon: Icon(Icons.phone, size: 20.sp),
        ),

        /// confirm Password section
        CommonText(text: AppString.dateOfBirth, bottom: 8, top: 16),
        CommonDateInputTextField(onSave: (date) {}),
        20.height,

        CommonButton(
          titleText: AppString.save,
          buttonWidth: 172,
          onTap: () {
            if (formKey2.currentState?.validate() == true) {
              formKey2.currentState?.save();
            }
          },
        ).center,
      ],
    ),
  );
}
