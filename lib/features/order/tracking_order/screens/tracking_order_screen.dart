// File: tracking_order_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/common/app_bar/common_app_bar.dart';
import 'package:bai_serve_customer/component/common_bar/common_bottom_bar.dart';
import 'package:bai_serve_customer/component/other_widgets/common_timeline.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/component/text_field/common_text_field.dart';
import 'package:bai_serve_customer/features/order/tracking_order/cubit/order_tracking_cubit.dart';
import 'package:bai_serve_customer/features/order/tracking_order/widgets/rider_info_widget.dart';
import 'package:bai_serve_customer/features/order/tracking_order/widgets/tracking_progress_widget.dart';
import 'package:bai_serve_customer/utils/app_utils.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:bai_serve_customer/utils/helpers/other_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class TrackingOrderScreen extends StatelessWidget {
  const TrackingOrderScreen({required this.commonBottomNavBar, super.key});

  final CommonBottomNavBar commonBottomNavBar;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CommonAppBar(title: AppString.percelTracking, leading: const SizedBox(width: 0, height: 0)),
    body: SingleChildScrollView(
      child: Padding(padding: const EdgeInsetsGeometry.only(left: 16, right: 16), child: _trackingBuilder()),
    ),
    bottomNavigationBar: commonBottomNavBar,
  );

  Widget _trackingBuilder() {
    return BlocProvider<OrderTrackingCubit>(
      create: (_) => OrderTrackingCubit(),
      child: BlocBuilder<OrderTrackingCubit, OrderTrackingState>(
        builder: (context, state) {
          final bloc = context.read<OrderTrackingCubit>();
          final trackingModel = state.trackingModel;

          return Column(
            children: [
              CommonTextField(
                prefixIcon: const Icon(Icons.search),
                hintText: AppString.trackingID,
                validator: OtherHelper.requiredFieldValidator,
                onSubmitted: (value) {
                  bloc.fetch(orderId: value);
                },
              ),
              if (state.isLoading)
                Padding(padding: const EdgeInsets.only(top: 50), child: const CircularProgressIndicator().center),
              if (trackingModel != null) ...[
                CommonText(
                  alignment: MainAxisAlignment.center,
                  text: Utils.formatDurationToHms(trackingModel.estimatedDeliveryTime),
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: AppColors.primaryText),
                ),
                CommonText(
                  alignment: MainAxisAlignment.center,
                  text: AppString.estimatedDeliveryTime,
                  style: getTheme.textTheme.bodyMedium,
                ),
                TrackingProgressWidget(trackingOrderModel: trackingModel),
                CommonTimeline(timeline: trackingModel.timeline),
                RiderInfoWidget(riderInfo: trackingModel.riderInfo),
              ],
            ],
          );
        },
      ),
    );
  }
}
