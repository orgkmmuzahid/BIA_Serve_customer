import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/component/button/slide_to_action_button.dart';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

@RoutePage()
class CallingScreen extends StatelessWidget {
  const CallingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SizedBox.expand(child: CommonImage(imageSrc: AppImages.callingBackground, fill: BoxFit.cover)),

          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.black.withAlpha(20), // Optional tint
            ),
          ),

          _action(isDailer: true),
        ],
      ),
    );
  }

  Padding _action({required bool isDailer}) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          150.height,
          const CommonImage(imageSrc: AppImages.homeBanner, fill: BoxFit.fill, size: 150, borderRadius: 150),
          10.height,
          const CommonText(
            text: 'Cameron Williamson',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textWhite),
            alignment: MainAxisAlignment.center,
          ),
          const CommonText(
            text: 'Ringing....',
            style: TextStyle(fontSize: 16, color: AppColors.textWhite),
            alignment: MainAxisAlignment.center,
          ),
          const Spacer(),
          isDailer
              ? SlideToActionButton(onAccept: appRouter.pop, onReject: appRouter.pop)
              : GestureDetector(
                onTap: Get.back,
                child: Container(
                  decoration: BoxDecoration(color: AppColors.serfeceBG, borderRadius: BorderRadius.circular(50)),
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 5),
                  child: const Icon(Icons.call_end, color: AppColors.error, size: 50),
                ),
              ),
          80.height,
        ],
      ),
    );
  }
}
