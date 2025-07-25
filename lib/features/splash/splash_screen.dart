import 'package:auto_route/auto_route.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/app_images.dart';
import '../../component/image/common_image.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
       WidgetsBinding.instance.addPostFrameCallback((_) {
      // Use context safely here
      Utils.deviceSize = MediaQuery.of(context).size;

      // Optional: Navigate after splash
      Future.delayed(const Duration(seconds: 1), () {
        context.router.replace(const OnboardingRoute());
      });
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
