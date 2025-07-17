import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/features/home/controller/home_controller.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title:  Text(AppString.drawerLanguage), centerTitle: true,),
    body: Column(
      children: [
           CommonButton(
            buttonWidth: 287,
              titleText: AppString.langEnglish,
              buttonColor: theme.scaffoldBackgroundColor,
              titleColor: theme.textTheme.bodyLarge!.color!,
              borderColor: theme.colorScheme.outlineVariant,
              icon: Padding(
                padding: EdgeInsetsGeometry.only(right: 17.9),
                child: CommonImage(imageSrc: AppImages.langEnglish, size: 24),
              ),
              onTap: (){
                Get.find<HomeController>().onCountryChange( Get.find<HomeController>().availableCountries.entries.first);
                Get.back();
              } ,
            ).center,
            18.height,

            CommonButton(
              buttonWidth: 287,
              titleText: AppString.langSwahili,
              buttonColor: theme.scaffoldBackgroundColor,
              titleColor: theme.textTheme.bodyLarge!.color!,
              borderColor: theme.colorScheme.outlineVariant,
              icon: Padding(
                padding: EdgeInsetsGeometry.only(right: 17.9),
                child: CommonImage(imageSrc: AppImages.langSwahili, size: 24),
              ),
              onTap: () {
                  Get.find<HomeController>().onCountryChange( Get.find<HomeController>().availableCountries.entries.last);
                Get.back();
              },
            ).center,
    ],),
  );
}