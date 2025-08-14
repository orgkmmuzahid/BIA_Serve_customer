// File: loyalty_points_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/loyalty_points/controllers/loyalty_points_controller.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@RoutePage()
class LoyaltyPointsScreen extends StatelessWidget {
  const LoyaltyPointsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        AppString.regularCustomersLoyaltyPoints,
        style: getTheme.textTheme.bodyLarge?.copyWith(
          color: getTheme.colorScheme.primary,
        ),
      ),
    ),
    body: Padding(
      padding: const EdgeInsetsGeometry.only(left: 16, right: 16),
      child: GetBuilder<LoyaltyPointsController>(
        builder: (controller) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: BoxBorder.all(color: getTheme.dividerColor),
                ),
                padding: const EdgeInsets.all(10),
                child: CommonText(
                  text: AppString.regularCustomersLoyaltyPointsMessage,
                  style: getTheme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 4,
                ),
              ),
              35.height,
              Stack(
                children: [
                  const CommonImage(
                    imageSrc: AppImages.loyaltyPonitsBackground,
                  ),
                  Positioned(
                    top: 20,
                    left: 70,
                    child: Icon(
                      Icons.star,
                      size: 50,
                      color: getTheme.colorScheme.onSecondary,
                    ),
                  ),

                  Positioned(
                    top: 60,
                    left: 50,
                    child: CommonText(
                      text: controller.loyaltyPoints.toString(),
                      style: getTheme.textTheme.bodyMedium?.copyWith(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: getTheme.colorScheme.onSecondary,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 110,
                    left: 55,
                    child: CommonText(
                      text: AppString.points,
                      style: getTheme.textTheme.bodyMedium?.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: getTheme.colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ],
              ),

              20.height,

              Container(
                color: getTheme.primaryColor.withValues(alpha: .2),
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 15,
                  bottom: 15,
                ),
                child: Row(
                  children: [
                    const CommonImage(imageSrc: AppImages.giftBox, size: 30),
                    10.width,
                    CommonText(
                      text: AppString.freeDelivery,
                      style: getTheme.textTheme.bodyMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    CommonText(
                      text: AppString.points10000,
                      style: getTheme.textTheme.bodyMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              10.height,
              Container(
                color: getTheme.primaryColor.withValues(alpha: .2),
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 15,
                  bottom: 15,
                ),
                child: Row(
                  children: [
                    const CommonImage(imageSrc: AppImages.giftBox, size: 30),
                    10.width,
                    CommonText(
                      text: AppString.off_10,
                      style: getTheme.textTheme.bodyMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    CommonText(
                      text: AppString.points1000,
                      style: getTheme.textTheme.bodyMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              20.height,
              CommonButton(
                titleText: AppString.viewRewards,
                onTap: () {
                  appRouter.push(const MyRewardsRoute());
                },
              ),
            ],
          );
        },
      ),
    ),
  );
}
