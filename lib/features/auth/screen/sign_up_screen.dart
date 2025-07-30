import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/component/button/common_gradient_button.dart';
import 'package:bai_serve_customer/component/image/image_picker/common_image_picker.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/app_string.dart';
import '../../../../../utils/extensions/extension.dart';
import '../controllers/sign_up_controller.dart';
import '../widgets/already_accunt_rich_text.dart';
import '../widgets/sign_up_all_filed.dart';

final _formKey = GlobalKey<FormState>();
@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<SignUpController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: controller.signUpFormKey,
              child: Column(
                children: [
                  20.height,
                  //upload image
                  CommonImagePicker(width: 150, height: 150, borderRadious: 150, pickerIcon: Icons.person),
                  10.height,
                  CommonText(text: AppString.profilePhoto, style: getTheme.textTheme.titleMedium, alignment: MainAxisAlignment.center),

                  // All Text Filed here
                  SignUpAllField(controller: controller, formKey: _formKey),
                  20.height,

                  // Submit Button Here
                  CommonGradientButton(
                    titleText: AppString.signUp,
                    isLoading: controller.isLoading,
                    onTap: () {
                      //on success
                      if (_formKey.currentState!.validate()) {
                        appRouter.popUntilRouteWithName(SignInRoute.name);
                      }

                      //remove it on release
                      appRouter.popUntilRouteWithName(SignInRoute.name);
                    },
                    buttonWidth: 132,
                    buttonHeight: 40,
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
