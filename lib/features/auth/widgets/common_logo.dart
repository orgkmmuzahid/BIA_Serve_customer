import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:flutter/material.dart';

class CommonLogo extends StatelessWidget {
  const CommonLogo({super.key});

  @override
  Widget build(BuildContext context) =>
      const CommonImage(imageSrc: AppImages.appsIcon, width: 124, height: 107);
}
