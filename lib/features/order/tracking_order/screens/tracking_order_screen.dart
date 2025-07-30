// File: tracking_order_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/common/app_bar/common_app_bar.dart';
import 'package:bai_serve_customer/component/common_bar/common_bottom_bar.dart';
import 'package:bai_serve_customer/component/other_widgets/common_timeline.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/component/text_field/common_text_field.dart';
import 'package:bai_serve_customer/features/order/tracking_order/controllers/tracking_order_controller.dart';
import 'package:bai_serve_customer/features/order/tracking_order/widgets/rider_info_widget.dart';
import 'package:bai_serve_customer/features/order/tracking_order/widgets/tracking_progress_widget.dart';
import 'package:bai_serve_customer/utils/app_utils.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';

@RoutePage()
class TrackingOrderScreen extends StatelessWidget {
  const TrackingOrderScreen({required this.commonBottomNavBar, super.key});

  final CommonBottomNavBar commonBottomNavBar;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CommonAppBar(title: AppString.percelTracking, leading: SizedBox(width: 0, height: 0)),
    body: GetBuilder<TrackingOrderController>(
      builder: (trackingOrderController) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsGeometry.only(left: 16, right: 16),
            child: Column(
              children: [
                CommonTextField(
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: trackingOrderController.onOrderTrackingFetch,
                  ),
                  hintText: AppString.trackingID,
                  controller: trackingOrderController.searchController,
                ),

                20.height,
                CommonText(
                  alignment: MainAxisAlignment.center,
                  text: Utils.formatDurationToHms(
                    trackingOrderController.trackingOrderDetails.data?.estimatedDeliveryTime ?? const Duration(),
                  ),
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: AppColors.primaryText),
                ),
                CommonText(
                  alignment: MainAxisAlignment.center,
                  text: AppString.estimatedDeliveryTime,
                  style: getTheme.textTheme.bodyMedium,
                ),
                20.height,
                if (trackingOrderController.trackingOrderDetails.data != null)
                  TrackingProgressWidget(trackingOrderModel: trackingOrderController.trackingOrderDetails.data!),
                20.height,
                if (trackingOrderController.trackingOrderDetails.data != null)
                  CommonTimeline(timeline: trackingOrderController.trackingOrderDetails.data!.timeline),
                20.height,
                if (trackingOrderController.trackingOrderDetails.data != null)
                  RiderInfoWidget(riderInfo: trackingOrderController.trackingOrderDetails.data!.riderInfo),
              ],
            ),
          ),
        );
      },
    ),
    bottomNavigationBar: commonBottomNavBar,
  );
}
