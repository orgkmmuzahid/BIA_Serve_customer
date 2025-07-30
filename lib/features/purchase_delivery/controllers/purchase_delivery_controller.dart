// File: purchase_delivery_controller.dart

import 'package:bai_serve_customer/features/purchase_delivery/model/purchase_delivery_model.dart';
import 'package:get/get.dart';

// Get.lazyPut(() => PurchaseDeliveryController(), fenix: true);

class PurchaseDeliveryController extends GetxController {
  PurchaseDeliveryModel purchaseDeliveryModel = PurchaseDeliveryModel(
    deliveryType: DeliveryType.insideTheCity,
    totalPay: 0,
  );

  void onFormChange(PurchaseDeliveryModel model) {
    purchaseDeliveryModel = model;
  }
}
