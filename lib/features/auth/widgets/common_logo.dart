import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:flutter/material.dart';

class CommonLogo extends StatelessWidget {
  const CommonLogo({super.key});

  @override
  Widget build(BuildContext context) =>
      CommonImage(imageSrc: AppImages.appsIcon, width: 124, height: 107);
}
