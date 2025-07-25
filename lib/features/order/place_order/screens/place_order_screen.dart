// File: place_order_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
import 'package:bai_serve/features/custom_google_map/widgets/custom_google_map.dart';
import 'package:bai_serve/features/order/place_order/controllers/place_order_controller.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@RoutePage()
class PlaceOrderScreen extends StatelessWidget {
  const PlaceOrderScreen({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) => GetBuilder<PlaceOrderController>(
    builder:
        (controller) => Scaffold(
          appBar: CommonAppBar(title: title),
          body: Padding(
            padding: const EdgeInsetsGeometry.all(16),
            child: Column(
              children: [
                _header(controller),
                if (controller.recentSearch.isNotEmpty) _recentSearch(controller).start,
                Expanded(child: _map()),

                CommonButton(
                  titleText: AppString.continues,
                  onTap: () {
                    if (title == AppString.homeBulkOrderAgents) {
                      //send to negotiation assistance.
                      appRouter.push(const NegotiationAssistanceRoute());
                      return;
                    }
                    if (controller.placeOrderModel.marchentAdressOnMap?.isNotEmpty == true &&
                        controller.placeOrderModel.clientAdressOnMap?.isNotEmpty == true) {
                      appRouter.push(PickUpInformationRoute(title: title));
                    }
                  },
                  buttonColor:
                      controller.marchentAddressTextEditController.text.isEmpty ? getTheme.disabledColor : null,
                ),
              ],
            ),
          ),
        ),
  );

  Widget _map() => const Card(child: CustomGoogleMap());

  Widget _header(PlaceOrderController controller) => Card(
    color: getTheme.scaffoldBackgroundColor,
    elevation: 2,
    shadowColor: getTheme.dividerColor,
    child: Column(
      children: [
        20.height,
        CommonText(text: AppString.setPickupDeliveryLocation, style: getTheme.textTheme.bodyLarge),
        CommonTextField(
          prefixIcon: Icon(Icons.my_location, color: getTheme.primaryColor),
          controller: controller.clientAddressTextEditController,
          borderColor: getTheme.dividerColor,
        ).paddingOnly(top: 10, left: 20, right: 20),
        CommonTextField(
          prefixIcon: const Icon(Icons.place),
          controller: controller.marchentAddressTextEditController,
          borderColor: getTheme.dividerColor,
        ).paddingOnly(top: 10, left: 20, right: 20),
        20.height,
      ],
    ),
  );

  Widget _recentSearch(PlaceOrderController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        34.height,
        CommonText(text: AppString.recentSearch, style: getTheme.textTheme.bodyLarge).paddingOnly(bottom: 10),
        ...List.generate(controller.recentSearch.length, (index) {
          final String text = controller.recentSearch[index];
          return GestureDetector(
            onTap: () => controller.onRecentSearch(text),
            child: CommonText(
              top: 10,
              bottom: 10,
              right: 10,
              left: 10,
              text: text,
              enableBorder: true,
              style: getTheme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 12),
            ),
          );
        }),
      ],
    );
  }
}
