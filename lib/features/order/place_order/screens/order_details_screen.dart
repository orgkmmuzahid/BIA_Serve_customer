import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/component/text/common_rich_text.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/order/place_order/model/place_order_model.dart';
import 'package:bai_serve_customer/utils/app_utils.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({required this.placeOrderModel, super.key});
  final PlaceOrderModel placeOrderModel;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(AppString.orderDetails)),
    body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Table(
              columnWidths: const {0: FlexColumnWidth(1.8), 1: FlexColumnWidth(0.5), 2: FlexColumnWidth(3)},
                    children: [
                _rowBuilder(AppString.orderNo, placeOrderModel.orderNumber ?? ''),
                _rowBuilder(AppString.customer, placeOrderModel.customer ?? ''),
                _rowBuilder(AppString.phoneNumber, placeOrderModel.phoneNumber ?? ''),
                _rowBuilder(AppString.shippingAddress, placeOrderModel.shippingAddress ?? ''),
                _rowBuilder(AppString.productDetails, placeOrderModel.productDetails ?? ''),
                _rowBuilder(AppString.weight, '${placeOrderModel.weight} KG'),
                _rowBuilder(AppString.quantity, '${placeOrderModel.quantity} Box'),
                      _rowBuilder(
                        AppString.orderDateTime,
                        Utils.formatDateTime(placeOrderModel.orderDate ?? DateTime.now())),
                _rowBuilder(AppString.orderStatus, placeOrderModel.orderStatus ?? ''),
                _rowBuilder(AppString.totalPrice, 'TSH ${placeOrderModel.totalPrice}'),
                    ],
                  ),

                  20.height,
                  Row(
                    children: [
                _amountBuilder(
                        AppString.deliveryCharge,
                        placeOrderModel.deliveryCharge ?? 0,
                      ),
                      const Spacer(),
                _amountBuilder(
                        AppString.totalAmount,
                  (placeOrderModel.deliveryCharge ?? 0) + (placeOrderModel.totalPrice ?? 0),
                      ),
                    ],
                  ),
                  10.height,
                  CommonButton(
                    titleText: AppString.continues,
                    onTap: () {
                      appRouter.push(const PaymentRoute());
                    },
                  ),
                ],
              ),
            ),
          ),
    
  );

  Container _amountBuilder(String title, double price) {
    return Container(
      width: (Utils.deviceSize.width / 2) - 26,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: getTheme.colorScheme.secondary.withAlpha(20),
      ),
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: CommonRichText(
        richTextContent: [
          CommonSimpleRichTextContent(text: title, style: getTheme.textTheme.titleMedium),
          CommonSimpleRichTextContent(
            text: '\nTSH $price',
            style: getTheme.textTheme.bodyLarge?.copyWith(fontSize: 24),
          ),
        ],
      ),
    );
  }

  TableRow _rowBuilder(String title, String data) {
    return TableRow(
      children: [
        CommonText(
          text: title,
          textAlign: TextAlign.start,
          top: 10,
          style: getTheme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
        ),
        Center(
          child: CommonText(
            text: ':',
            top: 10,
            style: getTheme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        CommonText(
          text: data,
          textAlign: TextAlign.start,
          top: 10,
          style: getTheme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
