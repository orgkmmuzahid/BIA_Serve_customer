import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/text/common_rich_text.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/order/place_order/controllers/place_order_controller.dart';
import 'package:bai_serve_customer/utils/app_utils.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@RoutePage()
class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key})
    : orderListWidth = Utils.deviceSize.width - 32,
      orderlistImageWidth = (Utils.deviceSize.width - 32) / 3.2;
  final double orderListWidth;
  final double orderlistImageWidth;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text(AppString.checkout)),
    body: Padding(
      padding: const EdgeInsetsGeometry.only(left: 16, right: 16),
      child: GetBuilder<PlaceOrderController>(
        builder: (orderController) {
          return Column(
            children: [
              CommonText(text: AppString.productDetails, style: getTheme.textTheme.titleMedium).start,
              _orderListItem(orderController),
              _middleCard(orderController),
              _card([
                _rowBuilder(title: AppString.totalPrice, data: 'TSH ${orderController.orderDetailsModel.totalPrice}'),
                _rowBuilder(
                  title: AppString.deliveryCharge,
                  data: 'TSH ${orderController.orderDetailsModel.deliveryCharge}',
                ),
                _rowBuilder(
                  title: AppString.totalAmount,
                  data:
                      'TSH ${orderController.orderDetailsModel.totalPrice + orderController.orderDetailsModel.deliveryCharge}',
                  isBold: true,
                ),
                _rowBuilder(
                  isBold: true,
                  title: '${orderController.orderDetailsModel.discountPercentage}% ${AppString.discount}',
                  data:
                      'TSH ${getDeductedAmount(orderController.orderDetailsModel.discountPercentage, orderController.orderDetailsModel.deliveryCharge + orderController.orderDetailsModel.totalPrice)}',
                ),
                _rowBuilder(
                  isBold: true,
                  title: AppString.totalPay,
                  data:
                      'TSH ${orderController.orderDetailsModel.totalPrice + orderController.orderDetailsModel.deliveryCharge - (getDeductedAmount(orderController.orderDetailsModel.discountPercentage, orderController.orderDetailsModel.deliveryCharge + orderController.orderDetailsModel.totalPrice))}',
                ),
              ]),

              20.height,
              CommonText(
                style: getTheme.textTheme.titleMedium,
                text: orderController.orderDetailsModel.orderStatus,
                top: 10,
                bottom: 10,
                left: 20,
                enableBorder: true,
                backgroundColor: getTheme.colorScheme.secondary.withAlpha(30),
              ),
              20.height,

              CommonButton(
                titleText: AppString.placeOrder,
                onTap: () {
                  appRouter.popUntilRouteWithName(HomeRoute.name);
                },
              ),
            ],
          );
        },
      ),
    ),
  );

  double getDeductedAmount(double percentage, double totalAmount) => (percentage / 100) * totalAmount;

  Widget _rowBuilder({required String title, required String data, bool isBold = false}) => Container(
    padding: const EdgeInsets.only(bottom: 5, top: 5),
    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: getTheme.scaffoldBackgroundColor))),
    child: Row(
      children: [
        CommonText(
          text: title,
          style: getTheme.textTheme.bodyMedium?.copyWith(fontWeight: isBold ? FontWeight.bold : null),
        ),
        const Spacer(),
        CommonText(
          text: data,
          style: getTheme.textTheme.bodyMedium?.copyWith(fontWeight: isBold ? FontWeight.bold : null),
        ),
      ],
    ),
  );

  Card _middleCard(PlaceOrderController controller) {
    return _card([
      Container(
        decoration: BoxDecoration(color: getTheme.primaryColor, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(Icons.home, color: getTheme.colorScheme.onPrimary),
            CommonText(
              text: AppString.shippingAddress,
              style: getTheme.textTheme.bodyLarge?.copyWith(
                color: getTheme.colorScheme.onSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Icon(Icons.edit_square, color: getTheme.colorScheme.onPrimary),
          ],
        ),
      ),
      20.height,
      Row(
        children: [
          const Icon(Icons.person),
          10.width,
          CommonText(text: controller.placeOrderModel.clientFullName ?? ''),
        ],
      ),
      Row(children: [const Icon(Icons.phone), 10.width, CommonText(text: controller.placeOrderModel.phone ?? '')]),
      Row(
        children: [
          const Icon(Icons.place),
          10.width,
          CommonText(text: controller.clientAddressTextEditController.text),
        ],
      ),
    ]);
  }

  Card _card(List<Widget> list) {
    return Card(
      color: getTheme.primaryColor.withAlpha(15),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: getTheme.dividerColor),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(children: list),
      ),
    );
  }

  Widget _orderListItem(PlaceOrderController orderController) => SizedBox(
    width: orderListWidth,
    child: Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            CommonImage(imageSrc: AppImages.appsIcon, size: orderlistImageWidth),
            10.width,
            CommonRichText(
              richTextContent: [
                CommonSimpleRichTextContent(
                  text: '#${orderController.orderDetailsModel.orderCode}\n',
                  style: getTheme.textTheme.bodyLarge?.copyWith(color: getTheme.primaryColor),
                ),
                CommonSimpleRichTextContent(
                  text: 'Order Placed – ${Utils.formatDateTime(orderController.orderDetailsModel.orderDate)}\n',
                  style: getTheme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                CommonSimpleRichTextContent(
                  text: 'Parcel Picked Up – ${orderController.placeOrderModel.clientPickupTime}\n',
                  style: getTheme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                CommonSimpleRichTextContent(
                  text: 'Quantity – ${orderController.placeOrderModel.quantity}\n',
                  style: getTheme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                CommonSimpleRichTextContent(
                  text:
                      'Total Price – ${orderController.orderDetailsModel.totalPrice + orderController.orderDetailsModel.deliveryCharge}\n',
                  style: getTheme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
