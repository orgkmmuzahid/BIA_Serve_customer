import 'package:auto_route/auto_route.dart';
import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/features/order/place_order/controllers/place_order_controller.dart';
import 'package:bai_serve/features/order/place_order/widgets/coupon_section_widget.dart';
import 'package:bai_serve/features/order/place_order/widgets/door_to_door_delivery_type_widget.dart';
import 'package:bai_serve/features/order/place_order/widgets/pickup_information_form_widget.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _formKey = GlobalKey<FormState>();

@RoutePage()
class PickUpInformationScreen extends StatelessWidget {
  const PickUpInformationScreen({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CommonAppBar(
      title: title,
      onBackPress: Get.find<PlaceOrderController>().onBackpress,
    ),
    body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: GetBuilder<PlaceOrderController>(
          builder: (placeOrderController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const PickupInformationFormWidget(),
              
                // _multilineTextField(100).paddingOnly(bottom: 10), //itemDetails
                if (title == AppString.placeOrder)
                  CouponSectionWidget(placeOrderController: placeOrderController),

                if (title == AppString.homeDoorToDoorPickup)
                  const DoorToDoorDeliveryTypeWidget(),

                10.height,
                CommonButton(
                  titleText: AppString.continues,
                  onTap: () {
                    //  if( _formKey.currentState?.validate() == true){}
                    _formKey.currentState?.save();
                    placeOrderController.placeOrderNow();
                  },
                ),
              ],
            ).paddingOnly(left: 16, right: 16, bottom: 25);
          },
        ),
      ),
    ),
  );




}
