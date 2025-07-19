import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/text/common_rich_text.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

import '../../data/model/notification_model.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({required this.item, super.key});

  final NotificationModel item;

  @override
  Widget build(BuildContext context) => Card(
    color: theme.scaffoldBackgroundColor,
    child: Padding(
      padding: const EdgeInsetsGeometry.all(10),
      child: Row(
        children: [
          CommonImage(
            imageSrc: _getImage(),
            size: 26,
            imageColor: theme.primaryColor,
          ),
          10.width,
          CommonRichText(
            richTextContent: [
              CommonSimpleRichTextContent(
                text: item.title.newLine,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              CommonSimpleRichTextContent(
                text: item.subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.textTheme.bodySmall?.color,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

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
