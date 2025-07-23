import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/common_bar/common_tab_bar.dart';
import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_date_input_text_field.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/features/auth/controllers/change_password_controller.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:bai_serve/utils/helpers/other_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

final _form1 = GlobalKey<FormState>();

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CommonAppBar(title: AppString.profileInfo),

    body: Padding(
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
                const CommonImage(
                  imageSrc: AppImages.homeBanner,
                  fill: BoxFit.fill,
                  borderRadius: 130,
                  width: 130,
                  height: 130,
                ).center,
          ),
          10.height,
          Text('Cameron Williamson', style: getTheme.textTheme.bodyLarge),
          10.height,
          Expanded(
            child: CommonTabBar(
              tabs: const [AppString.editProfile, AppString.changePassword],
              tabViews: [_profileChange(), _changePassowrd()],
            ),
          ),
        ],
      ),
    ),
  );

  GetBuilder<ChangePasswordController> _changePassowrd() =>
      GetBuilder<ChangePasswordController>(
        builder: (controller) {
          return Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.height,

                /// current Password section
                const CommonText(text: AppString.currentPassword, bottom: 8),
                CommonTextField(
                  controller: controller.currentPasswordController,
                  hintText: AppString.currentPassword,
                  validator: OtherHelper.passwordValidator,
                  isPassword: true,
                  prefixIcon: Icon(Icons.lock, size: 20.sp),
                ),

                /// New Password section
                const CommonText(
                  text: AppString.newPassword,
                  bottom: 8,
                  top: 16,
                ),
                CommonTextField(
                  controller: controller.newPasswordController,
                  hintText: AppString.newPassword,
                  validator: OtherHelper.passwordValidator,
                  isPassword: true,
                  prefixIcon: Icon(Icons.lock, size: 20.sp),
                ),

                /// confirm Password section
                const CommonText(
                  text: AppString.confirmPassword,
                  bottom: 8,
                  top: 16,
                ),
                CommonTextField(
                  controller: controller.confirmPasswordController,
                  hintText: AppString.confirmPassword,
                  validator:
                      (value) => OtherHelper.confirmPasswordValidator(
                        value,
                        controller.newPasswordController,
                      ),
                  isPassword: true,
                  prefixIcon: Icon(Icons.lock, size: 20.sp),
                ),
                20.height,

                /// submit Button
                CommonButton(
                  titleText: AppString.save,
                  buttonWidth: 172,
                  isLoading: controller.isLoading,
                  onTap: controller.changePasswordRepo,
                ).center,
              ],
            ),
          );
        },
      );

  Form _profileChange() => Form(
    key: _form1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        30.height,

        /// current Password section
        const CommonText(text: AppString.fullName, bottom: 8),
        CommonTextField(
          hintText: AppString.fullName,
          validator: OtherHelper.requiredFieldValidator,
          prefixIcon: Icon(Icons.person, size: 20.sp),
        ),

        /// New Password section
        const CommonText(text: AppString.phoneNumber, bottom: 8, top: 16),
        CommonTextField(
          hintText: AppString.phoneNumber,
          validator: OtherHelper.phoneValidator,
          prefixIcon: Icon(Icons.phone, size: 20.sp),
        ),

        /// confirm Password section
        const CommonText(text: AppString.dateOfBirth, bottom: 8, top: 16),
        CommonDateInputTextField(onSave: (date) {}),
        20.height,

        CommonButton(
          titleText: AppString.save,
          buttonWidth: 172,
          onTap: () {
            _form1.currentState?.validate();
            _form1.currentState?.save();
          },
        ).center,
      ],
    ),
  );
}
