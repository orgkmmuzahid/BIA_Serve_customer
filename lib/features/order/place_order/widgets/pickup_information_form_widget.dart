import 'package:bai_serve_customer/common/inputdata/input_data.dart';
import 'package:bai_serve_customer/component/image/image_picker/common_multi_image_picker.dart';
import 'package:bai_serve_customer/component/other_widgets/common_drop_down.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/component/text_field/common_text_field.dart';
import 'package:bai_serve_customer/component/text_field/input_helper.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/utils/app_utils.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:bai_serve_customer/utils/log/app_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class PickupInformationFormWidget extends StatelessWidget {
  const PickupInformationFormWidget({super.key});
  @override
  Widget build(BuildContext context) => Column(
    children: [
      CommonText(text: AppString.pickupInformation, style: getTheme.textTheme.bodyLarge).paddingOnly(bottom: 10),
      _rowBuilder(
        _inputTextBuilder(
          prefixIcon: Icons.person,
          initialText: 'Km Muzahid',
          hint: AppString.fullName,
          validationType: ValidationType.validateFullName,
          isReadOnly: true,
          onSaved: (value, controller) {},
        ),
        _inputTextBuilder(
          prefixIcon: Icons.phone,
          hint: AppString.phoneNumber,
          validationType: ValidationType.validatePhone,
          onSaved: (value, controller) {
  
          },
        ),
      ),

      _rowBuilder(
        CommonDropDown<String>(
          hint: AppString.district,
          items: const [],
          onChanged: (value) {
          },
          nameBuilder: (String value) => value,
        ),
        CommonDropDown<String>(
          hint: AppString.city,
          items: const [],
          onChanged: (value) {
          },
          nameBuilder: (String value) => value,
        ),
      ),

      _rowBuilder(
        CommonDropDown<String>(
          hint: AppString.ward,
          items: const [],
          onChanged: (value) {
          },
          nameBuilder: (String value) => value,
        ),
        CommonDropDown<String>(
          hint: AppString.subWard,
          items: const [],
          onChanged: (value) {
          },
          nameBuilder: (String value) => value,
        ),
      ),

      _inputTextBuilder(
        hint: AppString.plotApartment,
        validationType: ValidationType.validateRequired,
        onSaved: (value, controller) {
        },
      ).paddingOnly(bottom: 10),
      _multilineTextField(100, onSave: (value) {}).paddingOnly(bottom: 10),

      //with time picker marchent
      _rowBuilder(
        CommonText(text: AppString.pickupTime, textAlign: TextAlign.start, style: getTheme.textTheme.titleSmall),
        CommonText(text: AppString.serviceType, textAlign: TextAlign.start, style: getTheme.textTheme.titleSmall),
      ),
      _rowBuilder(
        _inputTextBuilder(
          hint: Utils.formatTime(DateTime.now()),
          isReadOnly: true,
          validationType: ValidationType.validateTime,
          suffixIcon: _showTimer((time) {
          
          }),
          onSaved: (value, controller) {},
        ),
        CommonDropDown<String>(
          hint: AppString.outsideCity,
          items: const [],
          onChanged: (value) {
          },
          nameBuilder: (String value) => value,
        ),
      ),

      //image picker
      CommonText(text: AppString.addImage, textAlign: TextAlign.start, style: getTheme.textTheme.titleSmall),

      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: CommonMultiImagePickerFormField(onSaved: (newValue) {}),
      ),

      _rowBuilder(
        CommonText(text: AppString.productWieght, textAlign: TextAlign.start, style: getTheme.textTheme.titleSmall),
        CommonText(text: AppString.quantity, textAlign: TextAlign.start, style: getTheme.textTheme.titleSmall),
      ),

      _rowBuilder(
        _inputTextBuilder(
          hint: '100 KG',
          validationType: ValidationType.validateRequired,
          onSaved: (value, controller) {
           
          },
        ),
        _inputTextBuilder(
          hint: '12 Box',
          validationType: ValidationType.validateRequired,
          onSaved: (value, controller) {
          
          },
        ),
      ),

      //Delivery Address
      CommonText(text: AppString.deliveryAddress, style: getTheme.textTheme.bodyLarge).paddingOnly(bottom: 10),
      _rowBuilder(
        _inputTextBuilder(
          prefixIcon: Icons.person,
          hint: AppString.fullName,
          validationType: ValidationType.validateFullName,
          onSaved: (value, controller) {
           
          },
        ),
        _inputTextBuilder(
          prefixIcon: Icons.phone,
          hint: AppString.phoneNumber,
          validationType: ValidationType.validatePhone,
          onSaved: (value, controller) {
          },
        ),
      ),

      _rowBuilder(
        CommonDropDown<String>(
          hint: AppString.district,
          items: const [],
          onChanged: (value) {
           
          },
          nameBuilder: (String value) => value,
        ),
        CommonDropDown<String>(
          hint: AppString.city,
          items: const [],
          onChanged: (value) {
          },
          nameBuilder: (String value) => value,
        ),
      ),

      _rowBuilder(
        CommonDropDown<String>(
          hint: AppString.ward,
          items: const [],
          onChanged: (value) {
          },
          nameBuilder: (String value) => value,
        ),
        CommonDropDown(hint: AppString.subWard, items: const [], onChanged: (value) {}, nameBuilder: (value) => value),
      ),

      //time picker client
      _rowBuilder(
        CommonText(text: AppString.pickupTime, textAlign: TextAlign.start, style: getTheme.textTheme.titleSmall),
        CommonText(text: AppString.serviceType, textAlign: TextAlign.start, style: getTheme.textTheme.titleSmall),
      ),
      _rowBuilder(
        _inputTextBuilder(
          hint: '8:00 AM',
          isReadOnly: true,
          validationType: ValidationType.validateTime,
          suffixIcon: _showTimer((time) {
            AppLogger.debug('Piked time $time', tag: 'Pickup information screen');
         
          }),
          onSaved: (value, controller) {},
        ),
        CommonDropDown<String>(
          hint: AppString.outsideCity,
          items: const [],
          onChanged: (value) {
           
          },
          nameBuilder: (String value) => value,
        ),
      ),

      _inputTextBuilder(
        hint: AppString.plotApartment,
        validationType: ValidationType.validateRequired,
        onSaved: (value, controller) {
         
        },
      ).paddingOnly(bottom: 10),
    ],
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
    return Row(
      children: [Expanded(child: field1), SizedBox(width: space), Expanded(child: field2)],
    ).paddingOnly(bottom: 10);
  }

  CommonTextField _inputTextBuilder({
    required String hint,
    required Function(String, TextEditingController) onSaved,
    required ValidationType validationType,
    String? initialText,
    bool? isReadOnly,
    IconData? prefixIcon,
    Widget? suffixIcon,
  }) => CommonTextField(
    initialText: initialText,
    validationType: validationType,
    suffixIcon: suffixIcon,
    isReadOnly: isReadOnly ?? false,
    prefixIcon: prefixIcon == null ? null : _prefixBuilder(prefixIcon),
    hintText: hint,
    onSaved: onSaved,
    borderColor: getTheme.dividerColor,
  );

  Icon _prefixBuilder(IconData iconData) => Icon(iconData, color: getTheme.dividerColor);
}
