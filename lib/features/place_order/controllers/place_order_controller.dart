// File: place_order_controller.dart
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/loyalty_points/controllers/loyalty_points_controller.dart';
import 'package:bai_serve/features/place_order/model/place_order_model.dart';
import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/log/app_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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

  PlaceOrderModel placeOrderModel = PlaceOrderModel(clientPickupTime: '10:00 AM', marchentPickupTime: '10:00 AM', clientAdressOnMap: '2464 Royal Ln. Mesa, New Jersey 45463' ,quantity: 5, productWieght: 250.5);
   TextEditingController clientAddressTextEditController = TextEditingController(text: '2464 Royal Ln. Mesa, New Jersey 45463');
  TextEditingController marchentAddressTextEditController = TextEditingController();

   List<String> selectedImagesPath = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      // imageQuality: 85, // reduce size if needed
    );
    if (pickedFile != null) {
        if(selectedImagesPath.indexWhere((value)=> value == pickedFile.path)== -1) {
          selectedImagesPath.add( pickedFile.path);
          update();
        }
    }
  }

  void placeOrderNow()async{
    //on order success;
    Get.find<LoyaltyPointsController>().clean();
    Get.until((route)=> Get.currentRoute == AppRoutes.placeOrder);
  }

  
  void onCoupon(){
    goToScreen(AppRoutes.myRewards);
  }

  void onNoCoupon(){
    showCouponButton = false;
    update();
  }
  
  void onBackpress(){
    showCouponButton = true;
    selectedImagesPath.clear();
  }
  
  void onFormChange(PlaceOrderModel model){
    placeOrderModel = model;
  }

 void onRecentSearch(String text){
  placeOrderModel = placeOrderModel.copyWith(marchentAdressOnMap: text);
  marchentAddressTextEditController.text = text;
  update();
 }

 void showInformationForm(){
  AppLogger.debug(Get.find<LoyaltyPointsController>().offercode.toString());
  if(placeOrderModel.marchentAdressOnMap?.isNotEmpty == true && placeOrderModel.clientAdressOnMap?.isNotEmpty == true) Get.toNamed(AppRoutes.pickupInformation);
 }
  
  @override
  void onInit() {

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