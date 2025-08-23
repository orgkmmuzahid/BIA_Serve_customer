import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/component/other_widgets/dual_field_row_widget.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/loyalty_points/controllers/loyalty_points_controller.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class CouponSectionWidget extends StatelessWidget {
  const CouponSectionWidget({required this.totalPrice, super.key});
  final double? totalPrice;

  @override
  Widget build(BuildContext context) => _coupon();

  Widget _coupon() {
    return GetBuilder<LoyaltyPointsController>(
      builder: (loyaltyController) {
        return Column(
          children: [
            DualFieldRow(
              left: CommonButton(
                titleText: AppString.couponCode,
                onTap:
                    () => appRouter.push(
                      MyRewardsRoute(
                        onClaimSuccess: () {
                          appRouter.popUntilRouteWithName(PickUpInformationRoute.name);
                        },
                      ),
                    ),
              ),
              right: CommonButton(
                titleText: AppString.noCouponCode,
                buttonColor: getTheme.scaffoldBackgroundColor,
                borderColor: getTheme.dividerColor,
                titleColor: getTheme.textTheme.bodySmall!.color,
              ),
              space: 20,
            ),
            if (loyaltyController.offercode != null)
              CommonText(
                text: AppString.submitCodeBy,
                enableBorder: true,
                top: 15,
                bottom: 15,
                right: 10,
                left: 10,
                borderRadious: 10,
              ),
            10.height,
            CommonButton(
              buttonColor: getTheme.colorScheme.secondary.withAlpha(20),
              titleColor: getTheme.textTheme.bodyMedium?.color,
              titleText: '${AppString.totalPrice}: Tsh ${totalPrice ?? 0.0}',
            ),
          ],
        );
      },
    );
  }
}
