import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/features/place_order/controllers/place_order_controller.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:bai_serve/utils/log/app_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

 final _formKey = GlobalKey<FormState>();
class PickUpInformationScreen  extends StatelessWidget {
  const PickUpInformationScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CommonAppBar(title: AppString.placeOrder, onBackPress: Get.find<PlaceOrderController>().onBackpress),
    body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: GetBuilder<PlaceOrderController>(
          builder: (placeOrderController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            CommonText(text: AppString.pickupInformation, style: theme.textTheme.bodyLarge).paddingOnly(bottom: 10),
            _rowBuilder( _inputTextBuilder(prefixIcon:  Icons.person,hint:  AppString.fullName, onSaved: (p0) {}) , _inputTextBuilder( prefixIcon: Icons.phone, hint: AppString.phoneNumber, onSaved: (p0){})),
            
            _rowBuilder(_buildDropdown(AppString.district, [], (value){}), _buildDropdown(AppString.city, [], (value){})),
            _rowBuilder(_buildDropdown(AppString.ward, [], (value){}), _buildDropdown(AppString.subWard, [], (value){})),
             _inputTextBuilder(hint:  AppString.plotApartment, onSaved: (p0) {}).paddingOnly(bottom: 10),
            _multilineTextField(100).paddingOnly(bottom: 10),
            
            //with time picker marchent
            _rowBuilder(CommonText(text: AppString.pickupTime, textAlign: TextAlign.start,style: theme.textTheme.titleSmall), CommonText(text: AppString.serviceType, textAlign: TextAlign.start, style: theme.textTheme.titleSmall)),
            _rowBuilder(_inputTextBuilder(hint: placeOrderController.placeOrderModel.marchentPickupTime ?? '', isReadOnly: true, suffixIcon: _showTimer((time){
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(marchentPickupTime: time));
              placeOrderController.update();
            }),onSaved: (p0) {}), _buildDropdown(AppString.outsideCity, [], (value){})),
            
             _rowBuilder(CommonText(text: AppString.productWieght, textAlign: TextAlign.start, style: theme.textTheme.titleSmall), CommonText(text: AppString.quantity, textAlign: TextAlign.start, style: theme.textTheme.titleSmall)),
             _rowBuilder( _inputTextBuilder(hint: '' , initialText: '${placeOrderController.placeOrderModel.productWieght?.toString()} KG', onSaved: (p0) {}) , 
                    _inputTextBuilder( hint: '',initialText: '${placeOrderController.placeOrderModel.quantity?.toString()} Box', onSaved: (p0){})),
      
            //Delivery Address
           CommonText(text: AppString.deliveryAddress, style: theme.textTheme.bodyLarge).paddingOnly(bottom: 10),
            _rowBuilder( _inputTextBuilder(prefixIcon:  Icons.person,hint:  AppString.fullName, onSaved: (p0) {}) , _inputTextBuilder( prefixIcon: Icons.phone, hint: AppString.phoneNumber, onSaved: (p0){})),
            
            _rowBuilder(_buildDropdown(AppString.district, [], (value){}), _buildDropdown(AppString.city, [], (value){})),
            _rowBuilder(_buildDropdown(AppString.ward, [], (value){}), _buildDropdown(AppString.subWard, [], (value){})),
             
            //time picker client
            _rowBuilder(CommonText(text: AppString.pickupTime, textAlign: TextAlign.start,style: theme.textTheme.titleSmall), CommonText(text: AppString.serviceType, textAlign: TextAlign.start, style: theme.textTheme.titleSmall)),
            _rowBuilder(_inputTextBuilder(hint: placeOrderController.placeOrderModel.clientPickupTime ?? '', isReadOnly: true, suffixIcon: _showTimer((time){
              AppLogger.debug("Piked time $time", tag: "Pickup information screen");
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientPickupTime: time));
              placeOrderController.update();
            }),onSaved: (p0) {}), _buildDropdown(AppString.outsideCity, [], (value){})),
            
             _inputTextBuilder(hint:  AppString.plotApartment, onSaved: (p0) {}).paddingOnly(bottom: 10),
            _multilineTextField(100).paddingOnly(bottom: 10),
            if(placeOrderController.showCouponButton)
            _rowBuilder( CommonButton(titleText: AppString.couponCode, onTap: placeOrderController.onCoupon), CommonButton(titleText: AppString.noCouponCode,
             buttonColor: theme.scaffoldBackgroundColor, borderColor: theme.dividerColor, titleColor: theme.textTheme.bodySmall!.color, onTap: placeOrderController.onNoCoupon), space: 20 ),
            
            10.height,
            CommonButton(titleText: AppString.continues, onTap: () {
              _formKey.currentState?.save();
            },),
                ],).paddingOnly(left: 16, right: 16, bottom: 25);
          }
        )),
    ),
  );

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

  SizedBox _multilineTextField(double height) {
    return SizedBox(
height: height,
child: TextField(
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

  CommonTextField _inputTextBuilder({ String? initialText, bool? isReadOnly, IconData? prefixIcon, Widget? suffixIcon ,required String hint, required Function(String) onSaved}) => 
      CommonTextField(
        initialText: initialText,
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