import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/main.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

import '../model/notification_model.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({required this.item, super.key});

  final NotificationModel item;

  @override
  Widget build(BuildContext context) => _content(context);

  GestureDetector _content(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.type == NotificationType.verification) {
          appRouter.push(const VendorProofRoute());
          return;
        }

        showSnackBar(AppString.noDetailsAvailableForThisNotification);
      },
      child: Card(
        color: getTheme.scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsetsGeometry.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonImage(imageSrc: _getImage(), size: 26, imageColor: getTheme.primaryColor),
              10.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(text: item.title, style: getTheme.textTheme.titleSmall),
                    CommonText(text: item.subtitle, textAlign: TextAlign.justify, fontSize: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getImage() {
    switch (item.type) {
      case NotificationType.delivered:
        return AppImages.notificationDelivered;
      case NotificationType.onTheWay:
        return AppImages.notificationOnTheWay;
      default:
        return AppImages.notificationReady;
    }
  }
}
