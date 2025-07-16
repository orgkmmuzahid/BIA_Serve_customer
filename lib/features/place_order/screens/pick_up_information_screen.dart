import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/image/common_multiImage_picker.dart';
import 'package:bai_serve/component/other_widgets/common_drop_down.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/features/loyalty_points/controllers/loyalty_points_controller.dart';
import 'package:bai_serve/features/place_order/controllers/door_to_door_controller.dart';
import 'package:bai_serve/features/place_order/controllers/place_order_controller.dart';
import 'package:bai_serve/features/place_order/enum/delivery_type.dart';
import 'package:bai_serve/common/inputdata/input_data.dart';
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
            
            _rowBuilder(CommonDropDown<String>(hint: AppString.district, items: [], onChanged: (value){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(district: value));
            }, nameBuilder: (String value) => value,), CommonDropDown<String>(hint: AppString.city, items: [], onChanged: (value){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(city: value));
            }, nameBuilder: (String value) => value)),


            _rowBuilder(CommonDropDown<String>(hint: AppString.ward, items: [], onChanged: (value){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(ward: value));
            }, nameBuilder: (String value) => value), CommonDropDown<String>(hint: AppString.subWard, items: [], onChanged: (value){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(subWard: value));
            }, nameBuilder: (String value) => value)),


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
            }),onSaved: (p0) {}), CommonDropDown<String>(hint: AppString.outsideCity, items: [], onChanged: (value){
               placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(serviceType: value));
            }, nameBuilder: (String value)=> value)),

            //image picker
             CommonMultiimagePicker(),
              

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
            
            _rowBuilder(CommonDropDown<String>(hint: AppString.district, items: [], onChanged: (value){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientDistrict: value));
            }, nameBuilder: (String value)=> value,), CommonDropDown<String>(hint: AppString.city, items: [], onChanged: (value){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientCity: value));
            }, nameBuilder: (String value)=>value)),

            _rowBuilder(CommonDropDown<String>(hint: AppString.ward, items: [], onChanged: (value){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientWard: value));
            }, nameBuilder: (String value)=>value), CommonDropDown(hint: AppString.subWard, items: [], onChanged: (value){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientSubWard: value));
            }, nameBuilder: (value)=>value)),
             
            //time picker client
            _rowBuilder(CommonText(text: AppString.pickupTime, textAlign: TextAlign.start,style: theme.textTheme.titleSmall), CommonText(text: AppString.serviceType, textAlign: TextAlign.start, style: theme.textTheme.titleSmall)),
            _rowBuilder(_inputTextBuilder(hint: placeOrderController.placeOrderModel.clientPickupTime ?? '', isReadOnly: true, suffixIcon: _showTimer((time){
              AppLogger.debug("Piked time $time", tag: "Pickup information screen");
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientPickupTime: time));
              placeOrderController.update();
            }),onSaved: (p0) {}), CommonDropDown<String>(hint: AppString.outsideCity, items: [], onChanged: (value){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientServiceType: value));
            }, nameBuilder: (String value)=>value)),
            
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
    var itemList = InputData.serviceTimes;
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


}

