import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/utils/helpers/other_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field_v2/phone_number.dart';

class SignUpController extends GetxController {
  /// Sign Up Form Key
  final signUpFormKey = GlobalKey<FormState>();

  bool isPopUpOpen = false;
  bool isLoading = false;

  List selectedOption = ['User', 'Consultant'];
  PhoneNumber phoneNumber = PhoneNumber(
    countryISOCode: 'bd',
    countryCode: '+880',
    number: '1826405558',
  );
  String selectRole = 'User';
  String countryCode = '+880';
  String? image;

  String signUpToken = '';

  static SignUpController get instance => Get.put(SignUpController());

  TextEditingController nameController = TextEditingController(
    text: kDebugMode ? 'Km M' : '',
  );
  TextEditingController passwordController = TextEditingController(
    text: kDebugMode ? 'hello123' : '',
  );
  TextEditingController confirmPasswordController = TextEditingController(
    text: kDebugMode ? 'hello123' : '',
  );

  void onPhoneNumberChange(PhoneNumber value) {
    phoneNumber = value;
  }

  void setSelectedRole(value) {
    selectRole = value;
    update();
  }

  Future<void> openGallery() async {
    image = await OtherHelper.openGallery();
    update();
  }

  Future<void> signUpUser({required String phoneNumber}) async {
    if (!signUpFormKey.currentState!.validate()) return;
    appRouter.push(const VerifyUserRoute());
    return;
  }
}
