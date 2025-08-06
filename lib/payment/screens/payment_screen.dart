import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/common/inputdata/input_data.dart';
import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/payment/controllers/payment_controller.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@RoutePage()
class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text(AppString.bankPayment)),
    body: GetBuilder<PaymentController>(
      builder: (paymentController) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              ...List.generate(InputData.paymentList.length + 1, (index) {
                if (index == 1)
                  return CommonText(
                    text: AppString.mobileBanking,
                    style: getTheme.textTheme.titleMedium,
                    alignment: MainAxisAlignment.center,
                    bottom: 15,
                    top: 10,
                  );
                final payment = InputData.paymentList.entries.elementAt(index == 0 ? 0 : index - 1);

                return GestureDetector(
                  onTap: () => paymentController.onPaymentChange(payment.key),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: BoxBorder.all(
                        color:
                            paymentController.selectedPayment == payment.key
                                ? getTheme.primaryColor
                                : getTheme.dividerColor,
                      ),
                      color:
                          paymentController.selectedPayment == payment.key
                              ? getTheme.colorScheme.primary.withAlpha(20)
                              : getTheme.scaffoldBackgroundColor,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          paymentController.selectedPayment == payment.key
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked,
                          color:
                              paymentController.selectedPayment == payment.key
                                  ? getTheme.colorScheme.primary
                                  : getTheme.dividerColor,
                        ),
                        10.width,
                        CommonImage(imageSrc: payment.value, width: 80, height: 30),
                      ],
                    ),
                  ),
                );
              }),

              10.height,
              CommonButton(
                titleText: AppString.continues,
                buttonWidth: 150,
                onTap: () {
                  // Get.toNamed(AppRoutes.checkout);
                },
              ),
            ],
          ),
        );
      },
    ),
  );
}
