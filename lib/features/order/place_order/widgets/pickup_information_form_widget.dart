import 'package:bai_serve/common/inputdata/input_data.dart';
import 'package:bai_serve/component/image/image_picker/common_multi_image_picker.dart';
import 'package:bai_serve/component/other_widgets/common_drop_down.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/features/order/place_order/controllers/place_order_controller.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:bai_serve/utils/helpers/other_helper.dart';
import 'package:bai_serve/utils/log/app_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickupInformationFormWidget extends StatelessWidget {
  const PickupInformationFormWidget({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<PlaceOrderController>(
    builder: (placeOrderController) {
      return Column(
        children: [
          CommonText(text: AppString.pickupInformation, style: getTheme.textTheme.bodyLarge).paddingOnly(bottom: 10),
          _rowBuilder(
            _inputTextBuilder(
              prefixIcon: Icons.person,
              hint: AppString.fullName,
              onSaved: (p0) {
                placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(fullName: p0));
              },
            ),
            _inputTextBuilder(
              prefixIcon: Icons.phone,
              hint: AppString.phoneNumber,
              validator: OtherHelper.phoneValidator,
              onSaved: (p0) {
                placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(phone: p0));
              },
            ),
          ),

          _rowBuilder(
            CommonDropDown<String>(
              hint: AppString.district,
              items: const [],
              onChanged: (value) {
                placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(district: value));
              },
              nameBuilder: (String value) => value,
            ),
            CommonDropDown<String>(
              hint: AppString.city,
              items: const [],
              onChanged: (value) {
                placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(city: value));
              },
              nameBuilder: (String value) => value,
            ),
          ),

          _rowBuilder(
            CommonDropDown<String>(
              hint: AppString.ward,
              items: const [],
              onChanged: (value) {
                placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(ward: value));
              },
              nameBuilder: (String value) => value,
            ),
            CommonDropDown<String>(
              hint: AppString.subWard,
              items: const [],
              onChanged: (value) {
                placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(subWard: value));
              },
              nameBuilder: (String value) => value,
            ),
          ),

          _inputTextBuilder(
            hint: AppString.plotApartment,
            onSaved: (p0) {
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(plotApartment: p0));
            },
          ).paddingOnly(bottom: 10),
          _multilineTextField(
            100,
            onSave: (p0) {
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(itemDetails: p0));
            },
          ).paddingOnly(bottom: 10),

          //with time picker marchent
          _rowBuilder(
            CommonText(text: AppString.pickupTime, textAlign: TextAlign.start, style: getTheme.textTheme.titleSmall),
            CommonText(text: AppString.serviceType, textAlign: TextAlign.start, style: getTheme.textTheme.titleSmall),
          ),
          _rowBuilder(
            _inputTextBuilder(
              hint: placeOrderController.placeOrderModel.marchentPickupTime ?? '',
              isReadOnly: true,
              suffixIcon: _showTimer((time) {
                placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(marchentPickupTime: time));
                placeOrderController.update();
              }),
              onSaved: (p0) {},
            ),
            CommonDropDown<String>(
              hint: AppString.outsideCity,
              items: const [],
              onChanged: (value) {
                placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(serviceType: value));
              },
              nameBuilder: (String value) => value,
            ),
          ),

          //image picker
          CommonText(text: AppString.addImage, textAlign: TextAlign.start, style: getTheme.textTheme.titleSmall),
  
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: CommonMultiImagePicker(),
          ),

          _rowBuilder(
            CommonText(text: AppString.productWieght, textAlign: TextAlign.start, style: getTheme.textTheme.titleSmall),
            CommonText(text: AppString.quantity, textAlign: TextAlign.start, style: getTheme.textTheme.titleSmall),
          ),

          _rowBuilder(
            _inputTextBuilder(
              hint: '${placeOrderController.placeOrderModel.productWieght?.toString()} KG',
              onSaved: (p0) {
                placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(productWieght: double.tryParse(p0)));
              },
            ),
            _inputTextBuilder(
              hint: '${placeOrderController.placeOrderModel.quantity?.toString()} Box',
              onSaved: (p0) {
                placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(quantity: int.tryParse(p0)));
              },
            ),
          ),

          //Delivery Address
          CommonText(text: AppString.deliveryAddress, style: getTheme.textTheme.bodyLarge).paddingOnly(bottom: 10),
          _rowBuilder(
            _inputTextBuilder(
              prefixIcon: Icons.person,
              hint: AppString.fullName,
              onSaved: (p0) {
                placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientFullName: p0));
              },
            ),
            _inputTextBuilder(
              prefixIcon: Icons.phone,
              hint: AppString.phoneNumber,
              validator: OtherHelper.phoneValidator,
              onSaved: (p0) {
                placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientPhone: p0));
              },
            ),
          ),

          _rowBuilder(
            CommonDropDown<String>(
              hint: AppString.district,
              items: const [],
              onChanged: (value) {
                placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientDistrict: value));
              },
              nameBuilder: (String value) => value,
            ),
            CommonDropDown<String>(
              hint: AppString.city,
              items: const [],
              onChanged: (value) {
                placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientCity: value));
              },
              nameBuilder: (String value) => value,
            ),
          ),

          _rowBuilder(
            CommonDropDown<String>(
              hint: AppString.ward,
              items: const [],
              onChanged: (value) {
                placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientWard: value));
              },
              nameBuilder: (String value) => value,
            ),
            CommonDropDown(
              hint: AppString.subWard,
              items: const [],
              onChanged: (value) {
                placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientSubWard: value));
              },
              nameBuilder: (value) => value,
            ),
          ),

          //time picker client
          _rowBuilder(
            CommonText(text: AppString.pickupTime, textAlign: TextAlign.start, style: getTheme.textTheme.titleSmall),
            CommonText(text: AppString.serviceType, textAlign: TextAlign.start, style: getTheme.textTheme.titleSmall),
          ),
          _rowBuilder(
            _inputTextBuilder(
              hint: placeOrderController.placeOrderModel.clientPickupTime ?? '',
              isReadOnly: true,
              suffixIcon: _showTimer((time) {
                AppLogger.debug('Piked time $time', tag: 'Pickup information screen');
                placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientPickupTime: time));
                placeOrderController.update();
              }),
              onSaved: (p0) {},
            ),
            CommonDropDown<String>(
              hint: AppString.outsideCity,
              items: const [],
              onChanged: (value) {
                placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientServiceType: value));
              },
              nameBuilder: (String value) => value,
            ),
          ),

          _inputTextBuilder(
            hint: AppString.plotApartment,
            onSaved: (p0) {
              placeOrderController.onFormChange(placeOrderController.placeOrderModel.copyWith(clientPlotApartment: p0));
            },
          ).paddingOnly(bottom: 10),
        ],
      );
    },
  );

  Widget _showTimer(Function(String value) ontTimeChange) {
    final itemList = InputData.serviceTimes;
    return PopupMenuButton<String>(
      icon: _prefixBuilder(Icons.access_time),
      color: getTheme.scaffoldBackgroundColor,
      initialValue: itemList.first,
      onSelected: ontTimeChange,
      itemBuilder: (BuildContext context) {
        return List.generate(itemList.length, (index) {
          return PopupMenuItem(value: itemList[index], child: CommonText(text: itemList[index]));
        });
      },
    );
  }

  SizedBox _multilineTextField(double height, {required Function(String) onSave}) {
    return SizedBox(
      height: height,
      child: TextFormField(
        onSaved: (newValue) {
          if (newValue != null && newValue.isNotEmpty) {
            onSave(newValue);
          }
        },
        maxLines: null,
        expands: true, // expands to fill parent height
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: getTheme.inputDecorationTheme.enabledBorder!.borderSide.copyWith(color: getTheme.dividerColor),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: AppString.itemDetails,
          contentPadding: const EdgeInsets.all(12),
        ),
      ),
    );
  }

  Widget _rowBuilder(Widget field1, Widget field2, {double space = 10}) {
    return Row(children: [Expanded(child: field1), SizedBox(width: space), Expanded(child: field2)]).paddingOnly(bottom: 10);
  }

  CommonTextField _inputTextBuilder({
    required String hint,
    required Function(String) onSaved,
    FormFieldValidator? validator,
    String? initialText,
    bool? isReadOnly,
    IconData? prefixIcon,
    Widget? suffixIcon,
  }) => CommonTextField(
    initialText: initialText,
    validator: validator,
    suffixIcon: suffixIcon,
    isReadOnly: isReadOnly ?? false,
    prefixIcon: prefixIcon == null ? null : _prefixBuilder(prefixIcon),
    hintText: hint,
    onSaved: onSaved,
    borderColor: getTheme.dividerColor,
  );

  Icon _prefixBuilder(IconData iconData) => Icon(iconData, color: getTheme.dividerColor);
}
