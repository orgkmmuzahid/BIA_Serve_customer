// File: place_order_controller.dart

import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/place_order/model/place_order_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// Get.lazyPut(() => PlaceOrderController(), fenix: true);

class PlaceOrderController extends GetxController {

  bool showCouponButton = true;
 
  List<String> serviceTimes = [
    "10:00 AM",
    "10:15 AM",
    "10:30 AM",
    "10:45 AM",
    "11:00 AM",
    "11:15 AM",
    "11:30 AM",
    "11:45 AM",
    "12:00 PM",
    ];

  List<String> recentSearch = [
    '2464 Royal Ln. Mesa, New Jersey 45463'
  ];
  TextEditingController clientAddressTextEditController = TextEditingController(text: '2464 Royal Ln. Mesa, New Jersey 45463');
  TextEditingController marchentAddressTextEditController = TextEditingController();

  PlaceOrderModel placeOrderModel = PlaceOrderModel(clientPickupTime: '10:00 AM', marchentPickupTime: '10:00 AM', quantity: 5, productWieght: 250.5);
  
  void onCoupon(){
    
  }

  void onNoCoupon(){
    showCouponButton = false;
    update();
  }
  
  void onBackpress(){
    showCouponButton = true;
  }
  
  void onFormChange(PlaceOrderModel model){
    placeOrderModel = model;
  }

 void onRecentSearch(String text){
  marchentAddressTextEditController.text = text; 
  update();
 }

 void showInformationForm(){
  if(marchentAddressTextEditController.text.isNotEmpty) Get.toNamed(AppRoutes.pickupInformation);
 }

 @override
  void onInit() {
    marchentAddressTextEditController.addListener((){
      print(marchentAddressTextEditController.text);
    });
    super.onInit();
  }

  @override
  void onClose() {
    marchentAddressTextEditController.dispose();
    clientAddressTextEditController.dispose();
    super.onClose();
  }
}