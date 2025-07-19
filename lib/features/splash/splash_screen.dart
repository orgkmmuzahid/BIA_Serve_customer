import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/route/app_routes.dart';
import '../../../../utils/constants/app_images.dart';
import '../../component/image/common_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      // if (LocalStorage.isLogIn) {
      //   if (LocalStorage.myRole == 'consultant') {
      //     Get.offAllNamed(AppRoutes.doctorHome);
      //   } else {
      //     Get.offAllNamed(AppRoutes.patientsHome);
      //   }
      // } else {
      Get.offAllNamed(AppRoutes.onboarding);
      Utils.deviceSize = MediaQuery.of(Get.context!).size;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          const CommonImage(
            imageSrc: AppImages.appsIcon,
            width: 210,
            height: 181,
          ).center,
    );
  }
}
