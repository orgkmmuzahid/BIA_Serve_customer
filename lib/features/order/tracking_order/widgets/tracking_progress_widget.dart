import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/other_widgets/common_liner_progress_step.dart';
import 'package:bai_serve_customer/component/text/common_rich_text.dart';
import 'package:bai_serve_customer/features/order/tracking_order/model/tracking_order_model.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

class TrackingProgressWidget extends StatelessWidget {
  const TrackingProgressWidget({required this.trackingOrderModel, super.key});

  final TrackingOrderModel trackingOrderModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cartBG,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonImage(imageSrc: trackingOrderModel.image, size: 92, borderRadius: 4),
                  10.width,
                  CommonRichText(
                    richTextContent: [
                      // CommonSimpleRichTextContent(
                      //   text: '#${model.trackingId}\n',
                      //   style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.primaryColor2),
                      // ),
                      CommonSimpleRichTextContent(
                        text: '${AppString.senderName} : ${trackingOrderModel.senderName}\n',
                        style: getTheme.textTheme.titleSmall,
                      ),
                      CommonSimpleRichTextContent(
                        text: '${AppString.phoneNumber} : ${trackingOrderModel.phoneNumber}\n',
                        style: getTheme.textTheme.titleSmall,
                      ),
                      CommonSimpleRichTextContent(text: '-------------------------------\n'),
                      CommonSimpleRichTextContent(
                        text: '${AppString.reciverName} : ${trackingOrderModel.reciverName}\n',
                        style: getTheme.textTheme.titleSmall,
                      ),
                      CommonSimpleRichTextContent(
                        text: '${AppString.phoneNumber} : ${trackingOrderModel.reciverPhoneNumber}\n',
                        style: getTheme.textTheme.titleSmall,
                      ),
                      CommonSimpleRichTextContent(
                        text: '${AppString.address} : ${trackingOrderModel.address}\n',
                        style: getTheme.textTheme.titleSmall,
                      ),
                      CommonSimpleRichTextContent(
                        text: '${trackingOrderModel.status.displayName}\n',
                        style: getTheme.textTheme.titleSmall?.copyWith(color: AppColors.primaryColor2),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CommonLinerProgressStep(
              steps: [
                CommonImage(imageSrc: AppImages.step(1)),
                CommonImage(imageSrc: AppImages.step(2)),
                CommonImage(imageSrc: AppImages.step(3)),
                CommonImage(imageSrc: AppImages.step(4)),
              ],
              currentStep: trackingOrderModel.stepNumber,
            ),
          ],
        ),
      ),
    );
  }
}
