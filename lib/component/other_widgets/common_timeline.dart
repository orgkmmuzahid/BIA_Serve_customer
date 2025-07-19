import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/features/tracking_order/model/order_timeline_model.dart';
import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

class CommonTimeline extends StatelessWidget {
  const CommonTimeline({required this.timeline, super.key});
  final List<OrderTimelineModel> timeline;

  @override
  Widget build(BuildContext context) =>
      Column(children: _timelineBuilder().toList());

  Iterable<Padding> _timelineBuilder() => timeline.map(
    (value) => Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CommonText(
                text: Utils.formatDateToShortMonth(value.time),
                style: theme.textTheme.titleMedium?.copyWith(
                  color:
                      value.isCleared
                          ? AppColors.primaryText
                          : AppColors.secondaryText,
                ),
              ),
              CommonText(
                text: Utils.formatTime(value.time),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.secondaryText,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundColor:
                value.isCleared ? AppColors.success : AppColors.disable,
            child: const Icon(Icons.check, size: 30),
          ),
          const SizedBox(width: 10),
          // No Flexible here
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: value.title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color:
                        value.isCleared
                            ? AppColors.primaryColor
                            : AppColors.secondaryText,
                  ),
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.start,
                ),
                CommonText(
                  text: value.subtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color:
                        value.isCleared
                            ? AppColors.primaryText
                            : AppColors.secondaryText,
                  ),
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
