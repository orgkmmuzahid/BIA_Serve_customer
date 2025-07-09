// File: place_order_controller.dart

import 'package:bai_serve/config/route/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// Get.lazyPut(() => PlaceOrderController(), fenix: true);

class PlaceOrderController extends GetxController {
  List<String> recentSearch = [
    '2464 Royal Ln. Mesa, New Jersey 45463'
  ];
  TextEditingController clientAddressTextEditController = TextEditingController(text: '2464 Royal Ln. Mesa, New Jersey 45463');
  TextEditingController marchentAddressTextEditController = TextEditingController();
  
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