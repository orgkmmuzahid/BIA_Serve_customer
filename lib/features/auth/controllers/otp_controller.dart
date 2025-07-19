import 'dart:async';

import 'package:bai_serve/config/api/api_end_point.dart';
import 'package:bai_serve/services/api/api_service.dart';
import 'package:bai_serve/services/storage/storage_keys.dart';
import 'package:bai_serve/services/storage/storage_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

enum OtpFor { signup, forgetPassword }

class OtpController extends GetxController {
  OtpFor otpFor = OtpFor.signup;
  Timer? _timer;
  int start = 0;
  bool isLoadingVerify = false;
  String time = '';
  TextEditingController phoneController = TextEditingController(
    text: kDebugMode ? '+123456789' : '',
  );

  TextEditingController otpController = TextEditingController(
    text: kDebugMode ? '123456' : '',
  );

  void startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    start = 10; // Reset the start value
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start > 0) {
        start--;
        final minutes = (start ~/ 60).toString().padLeft(2, '0');
        final seconds = (start % 60).toString().padLeft(2, '0');

        time = '$minutes:$seconds';

        update();
      } else {
        _timer?.cancel();
      }
    });
  }

  void changeOtpFor(OtpFor otpFor) {
    this.otpFor = otpFor;
  }

  Future<void> verifyOtpRepo(String route) async {
    Get.toNamed(route);
    return;

    isLoadingVerify = true;
    update();
    final Map<String, String> body = {'otp': otpController.text};
    // Map<String, String> header = {"SignUpToken": "signUpToken $signUpToken"};
    final response = await ApiService.post(
      ApiEndPoint.verifyEmail,
      body: body,
      // header: header,
    );

    if (response.statusCode == 200) {
      final data = response.data;

      LocalStorage.token = data['data']['accessToken'];
      LocalStorage.userId = data['data']['attributes']['_id'];
      LocalStorage.myImage = data['data']['attributes']['image'];
      LocalStorage.myName = data['data']['attributes']['fullName'];
      LocalStorage.myEmail = data['data']['attributes']['email'];
      LocalStorage.isLogIn = true;

      LocalStorage.setBool(LocalStorageKeys.isLogIn, LocalStorage.isLogIn);
      LocalStorage.setString(LocalStorageKeys.token, LocalStorage.token);
      LocalStorage.setString(LocalStorageKeys.userId, LocalStorage.userId);
      LocalStorage.setString(LocalStorageKeys.myImage, LocalStorage.myImage);
      LocalStorage.setString(LocalStorageKeys.myName, LocalStorage.myName);
      LocalStorage.setString(LocalStorageKeys.myEmail, LocalStorage.myEmail);

      // if (LocalStorage.myRole == 'consultant') {
      //   Get.toNamed(AppRoutes.personalInformation);
      // } else {
      //   Get.offAllNamed(AppRoutes.patientsHome);
      // }
    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }

    isLoadingVerify = false;
    update();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
