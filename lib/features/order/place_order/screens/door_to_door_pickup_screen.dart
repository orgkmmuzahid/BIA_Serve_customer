import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/order/place_order/controllers/door_to_door_controller.dart';
import 'package:bai_serve_customer/features/order/place_order/enum/pickup_type.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@RoutePage()
class DoorToDoorPickupScreen extends StatelessWidget {
  const DoorToDoorPickupScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text(AppString.homeDoorToDoorPickup)),
    body: GetBuilder<DoorToDoorController>(
      builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonButton(
              titleText: AppString.pickupFromMe,
              buttonWidth: 200,
              buttonColor: AppColors.primaryColor2,
              borderColor: AppColors.primaryColor2,
              onTap:
                  (){
                    controller.onPickupTypeChange(PickupType.pickupFromMe);
                      appRouter.push(PlaceOrderRoute(title: AppString.homeDoorToDoorPickup));
                    },
            ).center,
            10.height,
            CommonButton(
              onTap:
                  () {
                controller.onPickupTypeChange(
                    PickupType.pickupFromVendor,
                  );
                appRouter.push(PlaceOrderRoute(title: AppString.homeDoorToDoorPickup));
              },
              titleText: AppString.pickupFromVendor,
              buttonWidth: 200,
            ),
          ],
        );
      },
    ),
  );
}
