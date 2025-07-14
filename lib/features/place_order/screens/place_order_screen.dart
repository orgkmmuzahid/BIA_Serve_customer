// File: place_order_screen.dart
import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/features/custom_google_map/widgets/custom_google_map.dart';
import 'package:bai_serve/features/place_order/controllers/place_order_controller.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// static const String placeOrder = "/place_order_screen.dart";
// GetPage(name: placeOrder, page: () => const PlaceOrderScreen()),

class PlaceOrderScreen extends StatelessWidget {
   PlaceOrderScreen({super.key}) : title = (Get.arguments == null? {} : Get.arguments as Map<String, dynamic>)['title'] ?? AppString.placeOrder;

   final String title;

  @override
  Widget build(BuildContext context) => GetBuilder<PlaceOrderController>(builder: (controller)=> Scaffold(
    appBar: CommonAppBar(title: title), 
    body: Padding(padding: EdgeInsetsGeometry.all(16), child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      _header(controller),
      if(controller.recentSearch.isNotEmpty)
      _recentSearch(controller).start, 
      Expanded(child: _map()),
      
      CommonButton(titleText: AppString.continues, onTap:()=> controller.showInformationForm(title), 
      buttonColor: controller.marchentAddressTextEditController.text.isEmpty? theme.disabledColor : null )
    ],)),
  ));
  
  Widget _map()=> Card(
    child: CustomGoogleMap(),
  );

  Widget _header(PlaceOrderController controller)=> Card(
    color: theme.scaffoldBackgroundColor,
    elevation: 2,
    shadowColor: theme.dividerColor,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    20.height,
    CommonText(text: AppString.setPickupDeliveryLocation, style: theme.textTheme.bodyLarge),
    CommonTextField(prefixIcon: Icon(Icons.my_location, color: theme.primaryColor), controller: controller.clientAddressTextEditController, borderColor: theme.dividerColor).paddingOnly(top: 10, left: 20, right: 20),
    CommonTextField(prefixIcon: Icon(Icons.place),controller: controller.marchentAddressTextEditController, 
    borderColor: theme.dividerColor).paddingOnly(top: 10, left: 20, right: 20),
    20.height
  ],));


  Widget _recentSearch(PlaceOrderController controller){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        34.height,
        CommonText(text: AppString.recentSearch, style:theme.textTheme.bodyLarge).paddingOnly(bottom: 10),
         ...List.generate(controller.recentSearch.length, (index){
         String text = controller.recentSearch[index];
         return GestureDetector(
          onTap: ()=> controller.onRecentSearch(text),
          child: CommonText(
          top: 10, bottom: 10, right: 10, left: 10,
          text: text,enableBorder: true ,style: theme.textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        )) );
         })
      ],
    );
  }

}