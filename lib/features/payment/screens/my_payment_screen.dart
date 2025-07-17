import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
class MyPaymentScreen extends StatelessWidget {
  const MyPaymentScreen({super.key});


    @override
  Widget build(BuildContext context) => Scaffold(appBar: CommonAppBar(title: AppString.myPayment), 
    body: Padding(padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(children: [
         Row(children: [
          CommonImage(imageSrc: AppImages.homeBanner, fill: BoxFit.fill, width: 40, height: 40, borderRadius: 40), 
          10.width,
         CommonText(text: 'Cameron Williamson', style: theme.textTheme.bodyLarge)
         ]), 
         10.height,
         Card(
          color: AppColors.success,
           child: SizedBox(
             height: 130,
             child: Row(children: [
              15.width,
              CommonImage(imageSrc: AppImages.money, width: 115, height: 115,),
              30.width,
              CommonText(text: '${AppString.monySign} 3500', style: theme.textTheme.bodyLarge?.copyWith(fontSize: 30, fontWeight: FontWeight.w700, color: AppColors.textWhite))
             ]),
           ),
         ), 

         10.height,

         CommonButton(titleText: AppString.withdraw, buttonWidth: 100 ).center

      ],),
     ),
  );
} 