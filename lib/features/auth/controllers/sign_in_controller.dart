import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  /// Sign in Button Loading variable
  bool isLoading = false;

  /// Sign in form key , help for Validation
  final formKey = GlobalKey<FormState>();

  /// email and password Controller here
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// Sign in Api call here

  Future<void> signInUser() async {
    // if (!formKey.currentState!.validate()) return;
    appRouter.replaceAll([const HomeRoute()]);
    return;
  }
}
