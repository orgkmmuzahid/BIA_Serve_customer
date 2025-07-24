import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/other_widgets/dual_field_row_widget.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/features/loyalty_points/controllers/loyalty_points_controller.dart';
import 'package:bai_serve/features/order/place_order/controllers/place_order_controller.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CouponSectionWidget extends StatelessWidget {

  const CouponSectionWidget({required this.placeOrderController, super.key});
  final PlaceOrderController placeOrderController;

  @override
  Widget build(BuildContext context) => _coupon();

  Widget _coupon() {
    return GetBuilder<LoyaltyPointsController>(
      builder: (loyaltyController) {
        return Column(
          children: [
            if (placeOrderController.showCouponButton &&
                loyaltyController.offercode == null)
              DualFieldRow(
               left:  CommonButton(
                  titleText: AppString.couponCode,
                  onTap: placeOrderController.onCoupon,
                ),
              right: CommonButton(
                  titleText: AppString.noCouponCode,
                  buttonColor: getTheme.scaffoldBackgroundColor,
                  borderColor: getTheme.dividerColor,
                  titleColor: getTheme.textTheme.bodySmall!.color,
                  onTap: placeOrderController.onNoCoupon,
                ),
                space: 20,
              ),
            if (loyaltyController.offercode != null)
              const CommonText(
                text: AppString.submitCodeBy,
                enableBorder: true,
                top: 15,
                bottom: 15,
                right: 10,
                left: 10,
                borderRadius: 10,
              ),
            10.height,
            CommonButton(
              buttonColor: getTheme.colorScheme.secondary.withAlpha(20),
              titleColor: getTheme.textTheme.bodyMedium?.color,
              titleText:
                  '${AppString.totalPrice}: Tsh ${placeOrderController.orderDetailsModel.totalPrice}',
            ),
          ],
        );
      },
    );
  }
}
