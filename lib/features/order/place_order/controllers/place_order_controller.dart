// File: place_order_controller.dart
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/custom_google_map/controllers/custom_google_map_controller.dart';
import 'package:bai_serve_customer/features/order/place_order/model/order_details_model.dart';
import 'package:bai_serve_customer/features/order/place_order/model/place_order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Get.lazyPut(() => PlaceOrderController(), fenix: true);

class PlaceOrderController extends GetxController {
  bool showCouponButton = true;

  List<String> recentSearch = ['2464 Royal Ln. Mesa, New Jersey 45463'];

  PlaceOrderModel placeOrderModel = PlaceOrderModel(
    clientPickupTime: '10:00 AM',
    clientFullName: 'Jack Taylor',
    marchentPickupTime: '10:00 AM',
    clientAdressOnMap: '2464 Royal Ln. Mesa, New Jersey 45463',
    quantity: 5,
    productWieght: 250.5,
  );

  TextEditingController clientAddressTextEditController = TextEditingController(
    text: '2464 Royal Ln. Mesa, New Jersey 45463',
  );
  TextEditingController marchentAddressTextEditController = TextEditingController();

  OrderDetailsModel orderDetailsModel = OrderDetailsModel(
    orderCode: 'orderCode',
    customer: 'customer name',
    phoneNumber: 'phoneNumber',
    shippingAddress: 'shippingAddress',
    productDetails: 'productDetails',
    weight: 10,
    quantity: 5,
    orderDate: DateTime.now(),
    orderStatus: 'orderStatus',
    totalPrice: 50,
    deliveryCharge: 20,
    discountPercentage: 10,
  );

  void placeOrderNow() async {
    //on order success;
    appRouter.push(const OrderDetailsRoute());
  }

  void onNoCoupon() {
    showCouponButton = false;
    update();
  }

  void onBackpress() {
    showCouponButton = true;
  }

  void onFormChange(PlaceOrderModel model) {
    placeOrderModel = model;
  }

  void onRecentSearch(String text) {
    placeOrderModel = placeOrderModel.copyWith(marchentAdressOnMap: text);
    marchentAddressTextEditController.text = text;
    update();
  }

  @override
  void onInit() {
    marchentAddressTextEditController.addListener(() {
      final text = marchentAddressTextEditController.text.trim();
      if (text.isEmpty || placeOrderModel.marchentAdressOnMap == text) return;
      placeOrderModel = placeOrderModel.copyWith(marchentAdressOnMap: text);
      update();
    });
    super.onInit();
  }

  @override
  void onClose() {
    // marchentAddressTextEditController.dispose();
    // clientAddressTextEditController.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    marchentAddressTextEditController.dispose();
    clientAddressTextEditController.dispose();
    super.dispose();
  }
}
