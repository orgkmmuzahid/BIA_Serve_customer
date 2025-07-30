import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/features/return_product/model/return_product_model.dart';
import 'package:bai_serve_customer/utils/app_utils.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

class ReturnProductBuilderWidget extends StatelessWidget {
  const ReturnProductBuilderWidget({required this.returnProduct, super.key, this.ontap});

  final ReturnProductModel returnProduct;
  final GestureTapCallback? ontap;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constrains) {
      return GestureDetector(
        onTap: ontap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CommonImage(imageSrc: returnProduct.image, size: 70, borderRadius: 70, fill: BoxFit.fill),
                10.width,
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        alignment: MainAxisAlignment.start,
                        text: returnProduct.name,
                        style: getTheme.textTheme.titleMedium?.copyWith(color: AppColors.primaryColor),
                      ),
                      CommonText(
                        alignment: MainAxisAlignment.start,
                        text: '${AppString.placeOrder}: ${Utils.formatDateTime(returnProduct.orderPlacedAt)}',
                        style: getTheme.textTheme.bodyMedium,
                      ),
                      CommonText(
                        alignment: MainAxisAlignment.start,
                        text: '${AppString.pickupTime}: ${Utils.formatDateTime(returnProduct.pickedUpAt)}',
                        style: getTheme.textTheme.bodyMedium?.copyWith(overflow: TextOverflow.fade),
                      ),
                      CommonText(
                        alignment: MainAxisAlignment.start,
                        text: '${AppString.inTransit}: ${Utils.formatDateTime(returnProduct.inTransit)}',
                        style: getTheme.textTheme.bodyMedium?.copyWith(overflow: TextOverflow.fade),
                      ),
                      CommonText(
                        alignment: MainAxisAlignment.start,
                        text: '${AppString.quantity}: ${returnProduct.quantity}',
                        style: getTheme.textTheme.bodyMedium?.copyWith(overflow: TextOverflow.fade),
                      ),
                      CommonText(
                        alignment: MainAxisAlignment.start,
                        text: '${AppString.totalPrice}: ${AppString.monySign} ${returnProduct.totalPrice}',
                        style: getTheme.textTheme.titleSmall?.copyWith(overflow: TextOverflow.fade),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
