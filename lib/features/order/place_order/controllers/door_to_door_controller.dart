import 'package:bai_serve_customer/features/order/place_order/enum/delivery_type.dart';
import 'package:bai_serve_customer/features/order/place_order/enum/pickup_type.dart';
import 'package:get/get.dart';

class DoorToDoorController extends GetxController {
  PickupType? pickupType;
  DeliveryType deliveryType = DeliveryType.regular;

  void onPickupTypeChange(PickupType pickupType) {
    this.pickupType = pickupType;
  }

  void onDeliveryTypeChange(DeliveryType deliveryType) {
    this.deliveryType = deliveryType;
    update();
  }
}
