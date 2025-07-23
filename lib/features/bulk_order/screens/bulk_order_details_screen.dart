import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_multiline_text_field.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/bulk_order/controllers/bulk_order_controller.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BulkOrderDetailsScreen extends StatelessWidget {
  const BulkOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text(AppString.orderDetails)),
    body: Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: GetBuilder<BulkOrderController>(
        builder: (bulkOrderController) {
          return Column(
            children: [
              CommonText(
                text: AppString.orderSummery,
                style: getTheme.textTheme.bodyLarge,
              ).start,
              CommonMultilineTextField(
                initialText: bulkOrderController.negotiationMessage,
                readOnly: true,
                height: 200,
                onSave: (String p1) {},
              ),
              20.height,
              if (bulkOrderController.bulkOrderDetailsModel == null)
                CommonTextField(
                  onSubmitted: bulkOrderController.onPromoSubmit,
                  hintText: AppString.submitPromoCode,
                  borderRadius: 4,
                  paddingVertical: 20,
                  borderColor:
                      getTheme
                          .inputDecorationTheme
                          .disabledBorder
                          ?.borderSide
                          .color,
                ),
              if (bulkOrderController.bulkOrderDetailsModel != null)
                ..._promoFeedBack(bulkOrderController),
              20.height,
              CommonButton(
                titleText: AppString.continues,
                onTap: () {
                  Get.toNamed(AppRoutes.payment);
                },
              ),
            ],
          );
        },
      ),
    ),
  );

  List<Widget> _promoFeedBack(BulkOrderController controller) {
    return [
      Table(
        columnWidths: const {
          0: FlexColumnWidth(.9),
          1: FlexColumnWidth(0.5),
          2: FlexColumnWidth(3),
        },
        children: [
          _rowBuilder(
            AppString.totalAmount,
            'TSH ${controller.bulkOrderDetailsModel?.totalAmount.toString()}',
          ),
          _rowBuilder(
            AppString.discount,
            'TSH ${controller.bulkOrderDetailsModel?.discountedAmount.toString()}',
          ),
          _rowBuilder(
            AppString.totalPay,
            'TSH ${controller.bulkOrderDetailsModel?.totalPayable.toString()}',
          ),
        ],
      ),
    ];
  }

  TableRow _rowBuilder(String title, String data) {
    return TableRow(
      children: [
        CommonText(
          text: title,
          textAlign: TextAlign.start,
          top: 10,
          style: getTheme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        Center(
          child: CommonText(
            text: ':',
            top: 10,
            style: getTheme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        CommonText(
          text: data,
          textAlign: TextAlign.start,
          top: 10,
          style: getTheme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
