// File: tracking_order_screen.dart
import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/common_bar/common_bottom_bar.dart';
import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/other_widgets/common_liner_progress_step.dart';
import 'package:bai_serve/component/other_widgets/common_timeline.dart';
import 'package:bai_serve/component/text/common_rich_text.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/features/tracking_order/controllers/tracking_order_controller.dart';
import 'package:bai_serve/features/tracking_order/model/tracking_order_model.dart';
import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

// static const String trackingOrder = "/tracking_order_screen.dart";
// GetPage(name: trackingOrder, page: () => const TrackingOrderScreen()),

class TrackingOrderScreen extends StatelessWidget {
  const TrackingOrderScreen({super.key});

   @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CommonAppBar(title: AppString.percelTracking,leading: SizedBox(width: 0, height: 0),),
    body: GetBuilder<TrackingOrderController>(
      builder: (trackingOrderController) {
        return SingleChildScrollView(
          child: Padding(padding: EdgeInsetsGeometry.only(left: 16, right: 16), 
           child: Column(
            children: [
               CommonText(alignment: MainAxisAlignment.center, text: Utils.formatDurationToHms(trackingOrderController.trackingOrderModel.estimatedDeliveryTime), 
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: AppColors.primaryText)),
              CommonText(alignment: MainAxisAlignment.center ,text: AppString.estimatedDeliveryTime, style: theme.textTheme.bodyMedium),
              _progressBuilder(trackingOrderController.trackingOrderModel),
              10.height,
              CommonTimeline(timeline: trackingOrderController.trackingOrderModel.timeline)
           ]),
          ),
        );
      }
    ), bottomNavigationBar: CommonBottomNavBar());
    
      Card _progressBuilder( TrackingOrderModel model) => Card(
        color: AppColors.cartBG2,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              CommonImage( imageSrc: model.image, size: 92, borderRadius: 4), 
              10.width, 
              CommonRichText(richTextContent: [
                CommonSimpleRichTextContent(text: '#${model.trackingId}\n', style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.primaryColor2)),
                CommonSimpleRichTextContent(text: '${AppString.senderName} : ${model.senderName}\n', style: theme.textTheme.titleSmall),
                CommonSimpleRichTextContent(text: '${AppString.phoneNumber} : ${model.phoneNumber}\n', style: theme.textTheme.titleSmall),
                CommonSimpleRichTextContent(text: '-------------------------------\n'),
                CommonSimpleRichTextContent(text: '${AppString.reciverName} : ${model.reciverName}\n', style: theme.textTheme.titleSmall),
                CommonSimpleRichTextContent(text: '${AppString.phoneNumber} : ${model.reciverPhoneNumber}\n', style: theme.textTheme.titleSmall),
                CommonSimpleRichTextContent(text: '${AppString.address} : ${model.address}\n',  style: theme.textTheme.titleSmall),
                CommonSimpleRichTextContent(text: '${model.status.displayName}\n', style: theme.textTheme.titleSmall?.copyWith(color: AppColors.primaryColor2)),
              ]),
                       ]),
               CommonLinerProgressStep(steps: [
                CommonImage(imageSrc: AppImages.step(1),),
                CommonImage(imageSrc: AppImages.step(2)),
                CommonImage(imageSrc: AppImages.step(3)),
                CommonImage(imageSrc: AppImages.step(4)),
               ], currentStep: model.stepNumber,)
            ],
          ),
        
        ),);
      

      

}