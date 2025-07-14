import 'dart:io';

import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/features/loyalty_points/controllers/loyalty_points_controller.dart';
import 'package:bai_serve/features/place_order/controllers/door_to_door_controller.dart';
import 'package:bai_serve/features/place_order/controllers/place_order_controller.dart';
import 'package:bai_serve/features/place_order/enum/delivery_type.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:bai_serve/utils/helpers/other_helper.dart';
import 'package:bai_serve/utils/log/app_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

 final _formKey = GlobalKey<FormState>();
class PickUpInformationScreen  extends StatelessWidget {
   PickUpInformationScreen({super.key}) : title = (Get.arguments == null? {} : Get.arguments as Map<String, dynamic>)['title'] ?? AppString.placeOrder;

   final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CommonAppBar(title: title, onBackPress: Get.find<PlaceOrderController>().onBackpress),
    body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: GetBuilder<PlaceOrderController>(
          builder: (placeOrderController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            CommonText(text: AppString.pickupInformation, style: theme.textTheme.bodyLarge).paddingOnly(bottom: 10),
            _rowBuilder( _inputTextBuilder(prefixIcon:  Icons.person,hint:  AppString.fullName, onSaved: (p0) { 
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(fullName: p0));}) ,
                 _inputTextBuilder( prefixIcon: Icons.phone, hint: AppString.phoneNumber,validator: OtherHelper.phoneValidator,onSaved: (p0){
                   placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(phone: p0));
                 })),
            
            _rowBuilder(_buildDropdown(AppString.district, [], (value){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(district: value));
            }), _buildDropdown(AppString.city, [], (value){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(city: value));
            })),


            _rowBuilder(_buildDropdown(AppString.ward, [], (value){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(ward: value));
            }), _buildDropdown(AppString.subWard, [], (value){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(subWard: value));
            })),


             _inputTextBuilder(hint:  AppString.plotApartment, onSaved: (p0) {
               placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(plotApartment: p0));
             }).paddingOnly(bottom: 10),
                    _multilineTextField(100, onSave: (p0) {
                       placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(itemDetails: p0));
                    },).paddingOnly(bottom: 10),
            
            //with time picker marchent
            _rowBuilder(CommonText(text: AppString.pickupTime, textAlign: TextAlign.start,style: theme.textTheme.titleSmall), CommonText(text: AppString.serviceType, textAlign: TextAlign.start, style: theme.textTheme.titleSmall)),
            _rowBuilder(_inputTextBuilder(hint: placeOrderController.placeOrderModel.marchentPickupTime ?? '', isReadOnly: true, suffixIcon: _showTimer((time){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(marchentPickupTime: time));
              placeOrderController.update();
            }),onSaved: (p0) {}), _buildDropdown(AppString.outsideCity, [], (value){
               placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(serviceType: value));
            })),

            //image picker
             GestureDetector(
               onTap: () {
                 placeOrderController.pickImage();
               },
               child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: theme.colorScheme.surfaceContainerLowest),
                height: 150, child: Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [Icon(Icons.add), CommonText(text: AppString.addImage)],))),
             ),
              20.height,

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: List.generate(placeOrderController.selectedImagesPath.length, (index){
                return Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.only(left: 12),
                  child: Image.file(
                    width: 80, height: 80,
                    File(placeOrderController.selectedImagesPath.elementAt(index))),
                );
              }),)),
              

             _rowBuilder(CommonText(text: AppString.productWieght, textAlign: TextAlign.start, style: theme.textTheme.titleSmall), CommonText(text: AppString.quantity, textAlign: TextAlign.start, style: theme.textTheme.titleSmall)),
             
             _rowBuilder( _inputTextBuilder(hint: '' , initialText: '${placeOrderController.placeOrderModel.productWieght?.toString()} KG', onSaved: (p0) {
               placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(productWieght: double.tryParse(p0)));
             }) , 
              _inputTextBuilder( hint: '',initialText: '${placeOrderController.placeOrderModel.quantity?.toString()} Box', onSaved: (p0){
                placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(quantity: int.tryParse(p0)));
              })),
      

            //Delivery Address
           CommonText(text: AppString.deliveryAddress, style: theme.textTheme.bodyLarge).paddingOnly(bottom: 10),
            _rowBuilder( _inputTextBuilder(prefixIcon:  Icons.person,hint:  AppString.fullName, onSaved: (p0) {
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientFullName: p0));
            }) , _inputTextBuilder( prefixIcon: Icons.phone, hint: AppString.phoneNumber,validator: OtherHelper.phoneValidator ,onSaved: (p0){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientPhone: p0));
            })),
            
            _rowBuilder(_buildDropdown(AppString.district, [], (value){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientDistrict: value));
            }), _buildDropdown(AppString.city, [], (value){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientCity: value));
            })),

            _rowBuilder(_buildDropdown(AppString.ward, [], (value){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientWard: value));
            }), _buildDropdown(AppString.subWard, [], (value){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientSubWard: value));
            })),
             
            //time picker client
            _rowBuilder(CommonText(text: AppString.pickupTime, textAlign: TextAlign.start,style: theme.textTheme.titleSmall), CommonText(text: AppString.serviceType, textAlign: TextAlign.start, style: theme.textTheme.titleSmall)),
            _rowBuilder(_inputTextBuilder(hint: placeOrderController.placeOrderModel.clientPickupTime ?? '', isReadOnly: true, suffixIcon: _showTimer((time){
              AppLogger.debug("Piked time $time", tag: "Pickup information screen");
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientPickupTime: time));
              placeOrderController.update();
            }),onSaved: (p0) {}), _buildDropdown(AppString.outsideCity, [], (value){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientServiceType: value));
            })),
            
             _inputTextBuilder(hint:  AppString.plotApartment, onSaved: (p0) {
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientPlotApartment: p0));
             }).paddingOnly(bottom: 10),

            // _multilineTextField(100).paddingOnly(bottom: 10), //itemDetails
            if(title == AppString.placeOrder)
            _coupon(placeOrderController),

            if(title == AppString.homeDoorToDoorPickup)
              _doorToDoorDeliveryType(),
            
           
            10.height,
            CommonButton(titleText: AppString.continues, onTap: () {
            //  if( _formKey.currentState?.validate() == true){}
              _formKey.currentState?.save();
              placeOrderController.placeOrderNow();
            },),
                ],).paddingOnly(left: 16, right: 16, bottom: 25);
          }
        )),
    ),
  );

  GetBuilder<LoyaltyPointsController> _coupon(PlaceOrderController placeOrderController) {
    return GetBuilder<LoyaltyPointsController>(builder:(loyaltyController){
            return Column(children: [
               if(placeOrderController.showCouponButton && loyaltyController.offercode == null)
          _rowBuilder( CommonButton(titleText: AppString.couponCode, onTap: placeOrderController.onCoupon), CommonButton(titleText: AppString.noCouponCode,
           buttonColor: theme.scaffoldBackgroundColor, borderColor: theme.dividerColor, titleColor: theme.textTheme.bodySmall!.color, onTap: placeOrderController.onNoCoupon), space: 20 ),
            if(loyaltyController.offercode != null)
            CommonText(text: AppString.submitCodeBy, enableBorder: true, top: 15, bottom: 15, right: 10, left: 10, borderRadius: 10,),
            10.height,
              CommonButton( buttonColor: theme.colorScheme.secondary.withAlpha(20), titleColor: theme.textTheme.bodyMedium?.color ,titleText: '${AppString.totalPrice}: Tsh ${placeOrderController.orderDetailsModel.totalPrice}')
            ],);
          });
  }

  GetBuilder<DoorToDoorController> _doorToDoorDeliveryType() {
    return GetBuilder<DoorToDoorController>(builder: (doorToDoorConroller){
              return Row(children: [
                Expanded(
                  child: CommonButton(
                    onTap: () {
                      doorToDoorConroller.onDeliveryTypeChange(DeliveryType.urgent);
                    }, buttonColor: theme.scaffoldBackgroundColor,
                     borderColor: _getRadioColor(doorToDoorConroller, DeliveryType.urgent),
                     titleColor: _getRadioColor(doorToDoorConroller, DeliveryType.urgent)
                    ,titleText: AppString.urgentDelivery, icon: Icon(
                         doorToDoorConroller.deliveryType == DeliveryType.urgent ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                        color:  doorToDoorConroller.deliveryType == DeliveryType.urgent? theme.colorScheme.primary : theme.dividerColor,
                      ), ),
                ), 
                10.width,
                  Expanded(
                    child: CommonButton(  onTap: () {
                      doorToDoorConroller.onDeliveryTypeChange(DeliveryType.regular);
                    }, borderColor: _getRadioColor(doorToDoorConroller, DeliveryType.regular),
                    buttonColor: theme.scaffoldBackgroundColor, titleColor: _getRadioColor(doorToDoorConroller, DeliveryType.regular),
                    titleText: AppString.regularDelivery, icon: Icon(
                         doorToDoorConroller.deliveryType == DeliveryType.regular ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                        color:  doorToDoorConroller.deliveryType == DeliveryType.regular? theme.colorScheme.primary : theme.dividerColor,
                      ), ),
                  )
              ]);
            });
  }

 Color _getRadioColor(DoorToDoorController doorToDoorConroller, DeliveryType buttonType) =>  doorToDoorConroller.deliveryType == buttonType? theme.colorScheme.primary : theme.disabledColor;
 
  Widget _showTimer(Function(String value) ontTimeChange) {
    var itemList = Get.find<PlaceOrderController>().serviceTimes;
     return PopupMenuButton<String>(
      icon: _prefixBuilder(Icons.access_time),
      color: theme.scaffoldBackgroundColor,
      initialValue: itemList.first,
      onSelected: ontTimeChange,
      itemBuilder: (BuildContext context) { 
        return List.generate(itemList.length, (index){
         return PopupMenuItem( value: itemList[index],child: CommonText(text: itemList[index]));
        });
       },);
      }

  SizedBox _multilineTextField(double height, {required Function(String) onSave}) {
    return SizedBox(
height: height,
child: TextFormField(
  onSaved: (newValue) {
    if(newValue != null && newValue.isNotEmpty){
      onSave(newValue);
    }
  } ,
  maxLines: null,
  expands: true, // expands to fill parent height
  decoration: InputDecoration(
    enabledBorder: OutlineInputBorder(borderSide: theme.inputDecorationTheme.enabledBorder!.borderSide.copyWith(color: theme.dividerColor), borderRadius: BorderRadius.circular(10)),
    hintText: AppString.itemDetails,
    contentPadding: EdgeInsets.all(12),
  ),
),
);
  }

  Widget _rowBuilder(Widget field1, Widget field2, {double space = 10}) {
    return Row(children: [
      Expanded(child: field1),
      SizedBox(width: space),
      Expanded(child: field2),
    ]).paddingOnly(bottom: 10);
  }

  CommonTextField _inputTextBuilder({ FormFieldValidator? validator ,String? initialText, bool? isReadOnly, IconData? prefixIcon, Widget? suffixIcon ,required String hint, required Function(String) onSaved}) => 
      CommonTextField(
        initialText: initialText,
        validator: validator,
        suffixIcon: suffixIcon , isReadOnly: isReadOnly ?? false ,prefixIcon: prefixIcon == null? null : _prefixBuilder(prefixIcon), hintText: hint,onSaved: onSaved ,borderColor: theme.dividerColor,);
     
  Icon _prefixBuilder(IconData iconData) => Icon(iconData, color: theme.dividerColor);

 Widget _buildDropdown(
  String hint,
  List<String> items,
  Function(String? value) onChanged,
) {
  return DropdownButtonFormField<String>(
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    hint: CommonText(text: hint), 
    icon: Icon(Icons.arrow_drop_down),
    isExpanded: true,
    items: items.map((item) {
      return DropdownMenuItem<String>(
        value: item,
        child: CommonText(text: item),
      );
    }).toList(),
    onChanged: onChanged,
  );
}


}