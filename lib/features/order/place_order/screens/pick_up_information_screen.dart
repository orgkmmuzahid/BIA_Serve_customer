import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/common/app_bar/common_app_bar.dart';
import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/component/text_field/custom_form.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/features/order/place_order/cubit/place_order_cubit.dart';
import 'package:bai_serve_customer/features/order/place_order/cubit/place_order_state.dart';
import 'package:bai_serve_customer/features/order/place_order/widgets/coupon_section_widget.dart';
import 'package:bai_serve_customer/features/order/place_order/widgets/door_to_door_delivery_type_widget.dart';
import 'package:bai_serve_customer/features/order/place_order/widgets/pickup_information_form_widget.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';

@RoutePage()
class PickUpInformationScreen extends StatelessWidget {
  const PickUpInformationScreen({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) => BlocProvider<PlaceOrderCubit>(
    create: (context) => PlaceOrderCubit(),
    child: BlocBuilder<PlaceOrderCubit, PlaceOrderState>(
      builder: (context, state) {
        final cubit = context.read<PlaceOrderCubit>();
        return _content(cubit, state);
      },
    ),
  );

  Scaffold _content(PlaceOrderCubit cubit, PlaceOrderState state) {
    return Scaffold(
      appBar: CommonAppBar(title: title),
      body: SingleChildScrollView(
        child: CustomForm(
          builder: (context, formKey) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PickupInformationFormWidget(),

                // Conditionally show the coupon section
                if (title == AppString.placeOrder) CouponSectionWidget(totalPrice: state.placeOrderModel.totalPrice),

                // Conditionally show the door-to-door delivery type widget
                if (title == AppString.homeDoorToDoorPickup) const DoorToDoorDeliveryTypeWidget(),

                // Spacing
                10.height,

                // Submit button
                CommonButton(
                  titleText: AppString.continues,
                  onTap: () {
                    // Ensure form saves before calling placeOrderNow
                    formKey.currentState?.save();
                  },
                ),
              ],
            ).paddingOnly(left: 16, right: 16, bottom: 25);
          },
        ),
      ),
    );
  }
}
