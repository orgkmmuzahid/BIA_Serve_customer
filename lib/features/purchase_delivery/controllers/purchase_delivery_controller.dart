// File: purchase_delivery_controller.dart

import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/purchase_delivery/model/purchase_delivery_model.dart';
import 'package:flutter/material.dart';
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

  void onContinue(FormState? formState) {
    if (formState?.validate() == true) {
      //save form and process here
      //I used form save outside of it for ui phase
    }

    formState?.save();

    Get.toNamed(AppRoutes.payment);
  }
}
