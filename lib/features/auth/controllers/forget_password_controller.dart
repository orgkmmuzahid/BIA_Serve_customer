import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  bool isLoading = false;

  TextEditingController passwordController = TextEditingController(text: kDebugMode ? 'hello123' : '');
  TextEditingController confirmPasswordController = TextEditingController(text: kDebugMode ? 'hello123' : '');

  /// create Forget Password Controller instance
  static ForgetPasswordController get instance => Get.put(ForgetPasswordController());

  Future<void> resetPasswordRepo() async {
    appRouter.popUntilRouteWithName(SignInRoute.name);
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
