// File: place_order_controller.dart
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/loyalty_points/controllers/loyalty_points_controller.dart';
import 'package:bai_serve/features/place_order/model/order_details_model.dart';
import 'package:bai_serve/features/place_order/model/place_order_model.dart';
import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/log/app_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// Get.lazyPut(() => PlaceOrderController(), fenix: true);

class PlaceOrderController extends GetxController {

  bool showCouponButton = true;
  
  String? selectedPayment;


  List<String> recentSearch = [
    '2464 Royal Ln. Mesa, New Jersey 45463'
  ];

  PlaceOrderModel placeOrderModel = PlaceOrderModel(clientPickupTime: '10:00 AM',clientFullName: 'Jack Taylor' , marchentPickupTime: '10:00 AM', clientAdressOnMap: '2464 Royal Ln. Mesa, New Jersey 45463' ,quantity: 5, productWieght: 250.5);
   
  TextEditingController clientAddressTextEditController = TextEditingController(text: '2464 Royal Ln. Mesa, New Jersey 45463');
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
            deliveryCharge: 20, discountPercentage: 10);


  void onPaymentChange(String newPayment){
           selectedPayment = newPayment;
           update();
  }



  void placeOrderNow()async{
    //on order success;
    Get.toNamed(AppRoutes.orderDetails);
    // Get.find<LoyaltyPointsController>().clean();
    // Get.until((route)=> Get.currentRoute == AppRoutes.placeOrder);
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
  }
  
  void onFormChange(PlaceOrderModel model){
    placeOrderModel = model;
  }

 void onRecentSearch(String text){
  placeOrderModel = placeOrderModel.copyWith(marchentAdressOnMap: text);
  marchentAddressTextEditController.text = text;
  update();
 }

 void showInformationForm(String pageTitle){
  if(pageTitle == AppString.homeBulkOrderAgents){
    //send to negotiation assistance.
    Get.toNamed(AppRoutes.negotiationAssistance);
    return;
  }
  if(placeOrderModel.marchentAdressOnMap?.isNotEmpty == true && placeOrderModel.clientAdressOnMap?.isNotEmpty == true) Get.toNamed(AppRoutes.pickupInformation, arguments: {'title': pageTitle});
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