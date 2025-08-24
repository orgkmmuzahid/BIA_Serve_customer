// File: place_order_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/common/app_bar/common_app_bar.dart';
import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/custom_google_map/cubit/map_cubit/map_state.dart';
import 'package:bai_serve_customer/features/custom_google_map/widgets/custom_google_map.dart';
import 'package:bai_serve_customer/features/order/place_order/controllers/place_order_controller.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@RoutePage()
class PlaceOrderScreen extends StatelessWidget {
  const PlaceOrderScreen({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
          appBar: CommonAppBar(title: AppString.setPickupDeliveryLocation),
          body: CustomGoogleMap(
      widgets: (context, state) => [Align(alignment: Alignment.bottomCenter, child: _continueButton(state))],
          
        ),
  );

  Widget _continueButton(MapState state) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: CommonButton(
        buttonWidth: 150,
        titleText: AppString.continues,
        onTap: () {
          if (title == AppString.homeBulkOrderAgents) {
            //send to negotiation assistance.
            appRouter.push(const NegotiationAssistanceRoute());
            return;
          }
          if (state.mapRoute.isNotEmpty) {
            appRouter.push(PickUpInformationRoute(title: title));
          }
        },
        buttonColor: state.mapRoute.isEmpty ? getTheme.disabledColor : null,
      ),
    );
  }

}
