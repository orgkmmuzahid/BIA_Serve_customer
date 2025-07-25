import 'dart:async';
import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
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

  Future<void> verifyOtpRepo() async {
    if(otpFor == OtpFor.signup){
      appRouter.push(const SignUpRoute());
    }else if(otpFor == OtpFor.forgetPassword){
      appRouter.push(const ForgetPasswordRoute());
    }
    return;

  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
