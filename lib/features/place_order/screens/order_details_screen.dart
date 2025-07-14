
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/text/common_rich_text.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/place_order/controllers/place_order_controller.dart';
import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';

class OrderDetailsScreen  extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text(AppString.orderDetails)),
    body: GetBuilder<PlaceOrderController>(builder: (orderController)=> Padding(padding: EdgeInsets.only(left: 16, right: 16),
     child: Column(
       children: [
         Table(
           columnWidths: const {
          0: FlexColumnWidth(1.8),
             1: FlexColumnWidth(0.5),
             2: FlexColumnWidth(3),
           },
          children: [
            _rowBuilder(AppString.orderCode, orderController.orderDetailsModel.orderCode),
            _rowBuilder(AppString.customer, orderController.orderDetailsModel.customer),
            _rowBuilder(AppString.phoneNumber, orderController.orderDetailsModel.phoneNumber),
            _rowBuilder(AppString.shippingAddress, orderController.orderDetailsModel.shippingAddress),
            _rowBuilder(AppString.productDetails, orderController.orderDetailsModel.productDetails),
            _rowBuilder(AppString.weight, '${orderController.orderDetailsModel.weight} KG'),
            _rowBuilder(AppString.quantity, '${orderController.orderDetailsModel.quantity} Box'),
            _rowBuilder(AppString.orderDateTime, Utils.formatDateTime(orderController.orderDetailsModel.orderDate)),
            _rowBuilder(AppString.orderStatus, orderController.orderDetailsModel.orderStatus),
            _rowBuilder(AppString.totalPrice, 'TSH ${orderController.orderDetailsModel.totalPrice}'),
             
         ]),
          
          20.height,
          Row(children: [
           
          _amountBuilder(orderController,AppString.deliveryCharge , orderController.orderDetailsModel.deliveryCharge),
          const Spacer(),
          _amountBuilder(orderController,AppString.totalAmount , orderController.orderDetailsModel.deliveryCharge + orderController.orderDetailsModel.totalPrice),

          ],),
           10.height,
           CommonButton(titleText: AppString.continues, onTap: () {
             Get.toNamed(AppRoutes.payment);
           },)
       ],
     ),
     
     )),
  );

  Container _amountBuilder(PlaceOrderController orderController, String title, double price) {
    return Container(
      width: (Utils.deviceSize.width / 2) - 26,
      alignment: Alignment.center,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: theme.colorScheme.secondary.withAlpha(20),
),
padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
child: CommonRichText(
  richTextContent: [
    CommonSimpleRichTextContent(text: title, style: theme.textTheme.titleMedium),
    CommonSimpleRichTextContent(
      text: '\nTSH $price',
      style: theme.textTheme.bodyLarge?.copyWith(fontSize: 24),
    ),
  ],
),
);
  }

   TableRow _rowBuilder(String title, String data){
    return TableRow(children: [
      CommonText(text: title, textAlign: TextAlign.start, top: 10, style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),), 
       Center(child: CommonText(text: ':', top: 10, style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400))),
      CommonText(text: data, textAlign: TextAlign.start, top: 10, style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400))
    ]);
  }
}