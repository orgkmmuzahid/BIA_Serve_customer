import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:new_untitled/utils/helpers/other_helper.dart';

import '../../../config/route/app_routes.dart';
import '../../../services/api/api_service.dart';
import '../../../services/storage/storage_keys.dart';
import '../../../config/api/api_end_point.dart';
import '../../../services/storage/storage_services.dart';
import '../../../utils/app_utils.dart';

class SignUpController extends GetxController {
  /// Sign Up Form Key
  final signUpFormKey = GlobalKey<FormState>();

  bool isPopUpOpen = false;
  bool isLoading = false;

  List selectedOption = ["User", "Consultant"];

  String selectRole = "User";
  String countryCode = "+880";
  String? image;

  String signUpToken = '';

  static SignUpController get instance => Get.put(SignUpController());

  TextEditingController nameController = TextEditingController(
    text: kDebugMode ? "Km M" : "",
  );
  TextEditingController passwordController = TextEditingController(
    text: kDebugMode ? 'hello123' : '',
  );
  TextEditingController confirmPasswordController = TextEditingController(
    text: kDebugMode ? 'hello123' : '',
  );

  TextEditingController dobController = TextEditingController(
    text: kDebugMode ? "${DateTime.now().toLocal()}".split(' ')[0] : '',
  );

  onCountryChange(Country value) {
    countryCode = value.dialCode.toString();
  }

  setSelectedRole(value) {
    selectRole = value;
    update();
  }

  openGallery() async {
    image = await OtherHelper.openGallery();
    update();
  }

  signUpUser({required String phoneNumber}) async {
    if (!signUpFormKey.currentState!.validate()) return;
    Get.toNamed(AppRoutes.verifyUser);
    return;
    isLoading = true;
    update();
    Map<String, String> body = {
      "fullName": nameController.text,
      "phoneNumber": phoneNumber,
      "countryCode": countryCode,
      "password": passwordController.text,
      "role": selectRole.toLowerCase(),
    };

    var response = await ApiService.post(ApiEndPoint.signUp, body: body);

    if (response.statusCode == 200) {
      var data = response.data;
      signUpToken = data['data']['signUpToken'];
      Get.toNamed(AppRoutes.verifyUser);
    } else {
      Utils.errorSnackBar(response.statusCode.toString(), response.message);
    }
    isLoading = false;
    update();
  }
}
