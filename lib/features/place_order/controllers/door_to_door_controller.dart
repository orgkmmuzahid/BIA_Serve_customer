import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/place_order/enum/delivery_type.dart';
import 'package:bai_serve/features/place_order/enum/pickup_type.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:get/get.dart';

class DoorToDoorController extends GetxController {
  PickupType? pickupType;
  DeliveryType deliveryType = DeliveryType.regular;

  void onPickupTypeChange(PickupType pickupType) {
    this.pickupType = pickupType;
    Get.toNamed(
      AppRoutes.placeOrder,
      arguments: {'title': AppString.homeDoorToDoorPickup},
    );
  }

  void onDeliveryTypeChange(DeliveryType deliveryType) {
    this.deliveryType = deliveryType;
    update();
  }
}
