/// @author Km Muzahid
/// @email km.muzahid@gmail.com
/// @create date 2025-07-12 15:14:34
/// @modify date 2025-07-12 15:14:34
/// @desc [description]
library;

import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/features/loyalty_points/controllers/loyalty_points_controller.dart';
import 'package:bai_serve_customer/features/loyalty_points/model/loyalty_offer_model.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@RoutePage()
class MyRewardsScreen extends StatelessWidget {
  const MyRewardsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text(AppString.myRewards)),
    body: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: GetBuilder<LoyaltyPointsController>(
        builder: (loyaltyController) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  color: AppColors.primaryColor2,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            CommonText(
                              text: loyaltyController.rewardsLevel,
                              color: getTheme.colorScheme.onSecondary,
                              fontWeight: FontWeight.bold,
                            ),
                            20.height,
                            const CommonImage(
                              imageSrc: AppImages.loyaltyLevel,
                              size: 80,
                            ),
                          ],
                        ),
                        20.width,
                        CommonText(
                          text: loyaltyController.loyaltyPoints.toString(),
                          color: getTheme.colorScheme.onSecondary,
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
                20.height,
                ...List.generate(loyaltyController.loyltyOffers.length, (
                  index,
                ) {
                  final model = loyaltyController.loyltyOffers[index];
                  return _discountBuilder(model, loyaltyController);
                }),
              ],
            ),
          );
        },
      ),
    ),
  );

  Widget _discountBuilder(
    LoyaltyOfferModel model,
    LoyaltyPointsController controller,
  ) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: getTheme.colorScheme.primary.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(text: model.title, style: getTheme.textTheme.bodyLarge),
                CommonText(
                  text: '${model.rewardPoints} ${AppString.points}',
                  style: getTheme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.primaryColor2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 80,
            child: CommonButton(
              onTap: () {
                showDialog(
                  context: Get.context!,
                  builder:
                      (context) => AlertDialog(
                        backgroundColor: getTheme.scaffoldBackgroundColor,
                        content: IntrinsicHeight(
                          child: CommonText(
                            text: AppString.loaltyClaimingMessage(model.title),
                            maxLines: 5,
                            style: getTheme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          CommonButton(
                            onTap: () {
                              controller.onClaim(model);
                            },
                            titleText: AppString.continues,
                            buttonColor: getTheme.colorScheme.secondary,
                            buttonWidth: 100,
                          ),
                        ],
                      ),
                );
              },
              buttonRadius: 20,
              buttonHeight: 40,
              borderColor: AppColors.transparent,
              titleText: AppString.claim,
              buttonColor:
                  controller.loyaltyPoints >= model.rewardPoints
                      ? getTheme.colorScheme.error
                      : getTheme.dividerColor,
            ),
          ),
        ],
      ),
    );
  }
}
