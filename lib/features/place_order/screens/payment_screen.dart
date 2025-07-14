import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/place_order/controllers/place_order_controller.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(AppString.bankPayment)),
    body: GetBuilder<PlaceOrderController>(
      builder: (orderController) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(children: [
            ...List.generate(orderController.paymentList.length, (index){
          
              var payment =  orderController.paymentList.entries.elementAt(index);
          
              return GestureDetector(
                onTap: ()=> orderController.onPaymentChange(payment.key),
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: BoxBorder.all(color: orderController.selectedPayment == payment.key ?  theme.primaryColor  :theme.dividerColor),
                    color: orderController.selectedPayment == payment.key ? theme.colorScheme.primary.withAlpha(20) : theme.scaffoldBackgroundColor),
                  child: Row(
                    children: [
                    Icon(
                         orderController.selectedPayment == payment.key ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                        color: orderController.selectedPayment == payment.key? theme.colorScheme.primary : theme.dividerColor,
                      ),
                      CommonImage(imageSrc: payment.value, width: 80, height: 30,)
                  ],
                  ),
                ),
              );
            }),

            10.height,
            CommonButton(titleText: AppString.continues, buttonWidth: 150,
              onTap: () {
                Get.toNamed(AppRoutes.checkout);
              },
            )
          ],),
        );
      }
    ),
  );
}