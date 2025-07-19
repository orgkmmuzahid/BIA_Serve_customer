import 'package:bai_serve/component/button/common_gradient_button.dart';
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/auth/widgets/common_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/app_string.dart';
import '../../../../../utils/extensions/extension.dart';
import '../controllers/sign_up_controller.dart';
import '../widgets/already_accunt_rich_text.dart';
import '../widgets/sign_up_all_filed.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Section Starts Here
      appBar: AppBar(),

      /// Body Section Starts Here
      body: GetBuilder<SignUpController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: controller.signUpFormKey,
              child: Column(
                children: [
                  //logo
                  const CommonLogo().center,
                  50.height,

                  /// All Text Filed here
                  SignUpAllField(controller: controller, formKey: _formKey),
                  20.height,

                  /// Submit Button Here
                  CommonGradientButton(
                    titleText: AppString.signUp,
                    isLoading: controller.isLoading,
                    onTap: () {
                      //on success
                      if (_formKey.currentState!.validate()) {
                        Get.until(
                          (route) => route.settings.name == AppRoutes.signIn,
                        );
                      }

                      //remove it on release
                      Get.until(
                        (route) => route.settings.name == AppRoutes.signIn,
                      );
                    },
                    buttonWidth: 132,
                    buttonHeight: 32,
                  ),
                  60.height,

                  ///  Sign In Instruction here
                  const AlreadyAccountRichText(),
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
