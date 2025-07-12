/**
 * @author Km Muzahid
 * @email km.muzahid@gmail.com
 * @create date 2025-07-12 15:14:34
 * @modify date 2025-07-12 15:14:34
 * @desc [description]
 */
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/features/loyalty_points/controllers/loyalty_points_controller.dart';
import 'package:bai_serve/features/loyalty_points/model/loyalty_offer_model.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class MyRewardsScreen  extends StatelessWidget {
  const MyRewardsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(AppString.myRewards)), 
    body: Padding(padding: EdgeInsets.only(left: 16, right: 16),
     child: GetBuilder<LoyaltyPointsController>(
       builder: (loyaltyController) {
         return SingleChildScrollView(
          scrollDirection: Axis.vertical,
           child: Column(children: [
            Card(
              color: AppColors.rewardPointsColor,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(children: [
                  Column(
                    children: [
                      CommonText(text: loyaltyController.rewardsLevel, color: theme.colorScheme.onSecondary, fontWeight: FontWeight.bold,),
                      20.height,
                      CommonImage(imageSrc: AppImages.loyaltyLevel, size: 80),
                    ],
                  ), 
                  20.width,
                 CommonText(text: loyaltyController.loyaltyPoints.toString(), color: theme.colorScheme.onSecondary, fontSize: 64, fontWeight: FontWeight.bold),
                ],),
              )), 
              20.height,
              ...List.generate(loyaltyController.loyltyOffers.length, (index){
                var model = loyaltyController.loyltyOffers[index];
                return _discountBuilder(model, loyaltyController);
              }),
           ]),
         );
       }
     ),
    ),
    );


    Widget _discountBuilder( LoyaltyOfferModel model, LoyaltyPointsController controller){
      return Container(
        height: 70,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: theme.colorScheme.primary.withValues(alpha: .1), 
         borderRadius: BorderRadius.circular(10)
        ),
        child: 
      Row(children:[
         Expanded(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            CommonText(text: model.title, style: theme.textTheme.bodyLarge),
            CommonText(text: '${model.rewardPoints} ${AppString.points}', style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.rewardPointsColor, fontWeight: FontWeight.bold))
           ],),
         ), 
         const Spacer(),
         SizedBox(
          width: 80,
          child: CommonButton( 
            onTap: () {
              
              showDialog(
  context: Get.context!,
  builder: (context) => AlertDialog(
    backgroundColor: theme.scaffoldBackgroundColor,
    content: CommonText(text: AppString.loaltyClaimingMessage(model.title), maxLines: 5 ,style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400) ),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      CommonButton(
         onTap: () {
           controller.onClaim(model);
         },
        titleText: AppString.continues, buttonColor: theme.colorScheme.secondary, buttonWidth: 100,)
    ],
  ),
);

            }
            ,buttonRadius: 20, buttonHeight: 40, borderColor: AppColors.transparent ,titleText: AppString.claim ,buttonColor: controller.loyaltyPoints>= model.rewardPoints?  theme.colorScheme.error : theme.dividerColor))
      ]
      ));
    }


}