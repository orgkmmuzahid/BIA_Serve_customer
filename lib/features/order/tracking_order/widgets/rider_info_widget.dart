import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/other_widgets/common_ratting_bar.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
import 'package:bai_serve/features/order/tracking_order/model/rider_info_model.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class RiderInfoWidget extends StatelessWidget {
  const RiderInfoWidget({required this.riderInfo, super.key});

  final RiderInfoModel riderInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonText(text: AppString.riderDetails, style: getTheme.textTheme.bodyLarge),
        10.height,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonImage(imageSrc: riderInfo.image, size: 80, borderRadius: 80, fill: BoxFit.fill),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(text: riderInfo.name, style: getTheme.textTheme.titleMedium),
                    CommonRatingBar(rating: riderInfo.ratting, allowHalf: true, totalCount: riderInfo.totalCount, size: 15, spacing: 0),
                    10.height,
                    CommonText(text: riderInfo.bio, style: getTheme.textTheme.bodyMedium, textAlign: TextAlign.justify),
                    20.height,
                    CommonText(text: '${AppString.phoneNumber} : ${riderInfo.phoneNumber}', style: getTheme.textTheme.titleSmall),
                    20.height,
                    Row(
                      children: [
                        CommonButton(
                          titleText: AppString.callNow,
                          buttonColor: AppColors.success,
                          icon: const Icon(Icons.call, color: AppColors.iconColorWhite),
                          buttonWidth: 130,
                          onTap: () {
                            appRouter.push(const CallingRoute());                          },
                        ),
                        10.width,
                        CommonButton(
                          titleText: AppString.message,
                          buttonColor: AppColors.primaryButton,
                          icon: const Icon(Icons.message, color: AppColors.iconColorWhite),
                          buttonWidth: 130,
                          onTap: () {
                            appRouter.push(ChatRoute());
                          },
                        ),
                      ],
                    ),
                    30.height,
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
