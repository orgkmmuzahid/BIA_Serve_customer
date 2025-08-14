import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/features/order/place_order/controllers/door_to_door_controller.dart';
import 'package:bai_serve_customer/features/order/place_order/enum/delivery_type.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class DoorToDoorDeliveryTypeWidget extends StatelessWidget {
  const DoorToDoorDeliveryTypeWidget({super.key});

  @override
  Widget build(BuildContext context) => _doorToDoorDeliveryType();

  Widget _doorToDoorDeliveryType() {
    return GetBuilder<DoorToDoorController>(
      builder: (doorToDoorConroller) {
        return Row(
          children: [
            Expanded(
              child: CommonButton(
                titleSize: 12.sp,
                onTap: () {
                  doorToDoorConroller.onDeliveryTypeChange(DeliveryType.urgent);
                },
                buttonColor: getTheme.scaffoldBackgroundColor,
                borderColor: _getRadioColor(doorToDoorConroller, DeliveryType.urgent),
                titleColor: _getRadioColor(doorToDoorConroller, DeliveryType.urgent),
                titleText: AppString.urgentDelivery,
                icon: Icon(
                  doorToDoorConroller.deliveryType == DeliveryType.urgent
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color:
                      doorToDoorConroller.deliveryType == DeliveryType.urgent
                          ? getTheme.colorScheme.primary
                          : getTheme.dividerColor,
                ),
              ),
            ),
            5.width,
            Expanded(
              child: CommonButton(
                titleSize: 12.sp,
                onTap: () {
                  doorToDoorConroller.onDeliveryTypeChange(DeliveryType.regular);
                },
                borderColor: _getRadioColor(doorToDoorConroller, DeliveryType.regular),
                buttonColor: getTheme.scaffoldBackgroundColor,
                titleColor: _getRadioColor(doorToDoorConroller, DeliveryType.regular),
                titleText: AppString.regularDelivery,
                icon: Icon(
                  doorToDoorConroller.deliveryType == DeliveryType.regular
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color:
                      doorToDoorConroller.deliveryType == DeliveryType.regular
                          ? getTheme.colorScheme.primary
                          : getTheme.dividerColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Color _getRadioColor(DoorToDoorController doorToDoorConroller, DeliveryType buttonType) =>
      doorToDoorConroller.deliveryType == buttonType ? getTheme.colorScheme.primary : getTheme.disabledColor;
}
