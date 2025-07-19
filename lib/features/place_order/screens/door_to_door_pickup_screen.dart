import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/features/place_order/controllers/door_to_door_controller.dart';
import 'package:bai_serve/features/place_order/enum/pickup_type.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                  () => controller.onPickupTypeChange(PickupType.pickupFromMe),
            ).center,
            10.height,
            CommonButton(
              onTap:
                  () => controller.onPickupTypeChange(
                    PickupType.pickupFromVendor,
                  ),
              titleText: AppString.pickupFromVendor,
              buttonWidth: 200,
            ),
          ],
        );
      },
    ),
  );
}
