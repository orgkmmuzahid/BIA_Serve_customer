import 'package:auto_route/auto_route.dart';
import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../component/common_bar/common_bottom_bar.dart';
import '../../../component/other_widgets/common_loader.dart';
import '../../../component/other_widgets/no_data.dart';
import '../model/notification_model.dart';
import '../controller/notifications_controller.dart';
import '../widgets/notification_item.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      builder: (controller) {
        return Scaffold(
          /// App Bar Section starts here
          appBar: CommonAppBar(
            title: AppString.notifications,
            onBackPress: () {
              controller.notifications.clear();
            },
          ),

          /// Body Section starts here
          body: GetBuilder<NotificationsController>(
            builder: (controller) {
              return controller.isLoading
                  /// Loading bar here
                  ? const CommonLoader()
                  : controller.notifications.isEmpty
                  ///  data is Empty then show default Data
                  ? const NoData()
                  /// show all Notifications here
                  : ListView.builder(
                    controller: controller.scrollController,
                    padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                    itemCount:
                        controller.isLoadingMore
                            ? controller.notifications.length + 1
                            : controller.notifications.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      ///  Notification More Data Loading Bar
                      if (index > controller.notifications.length) {
                        return const CommonLoader(size: 40, strokeWidth: 2);
                      }
                      final NotificationModel item = controller.notifications[index];

                      ///  Notification card item
                      return NotificationItem(item: item);
                    },
                  );
            },
          ),

          /// Bottom Navigation Bar Section starts here
          bottomNavigationBar: const CommonBottomNavBar(),
        );
      },
    );
  }
}
