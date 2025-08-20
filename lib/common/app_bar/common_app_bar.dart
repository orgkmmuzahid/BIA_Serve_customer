
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/languages/widgets/common_language_slector.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/notifications/controller/notifications_controller.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
    this.title,
    this.onBackPress,
    this.titleWidget,
    this.leading,
    this.actions,
    this.isCenterTitle = true,
  });
  final String? title;
  final Widget? titleWidget;
  final Function()? onBackPress;
  final Widget? leading;
  final List<Widget>? actions;
  final bool isCenterTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
    centerTitle: isCenterTitle,
    actionsPadding: const EdgeInsets.only(bottom: 10),
    leading:
        leading ??
        IconButton(
          onPressed: () {
            if (onBackPress != null) {
              onBackPress!();
            }
            appRouter.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
    actions: actions ?? _appBarActions(),
    title: titleWidget ?? CommonText(text: title ?? '', fontWeight: FontWeight.w600, fontSize: 18.sp),
  );

  List<Widget> _appBarActions() => [
    GetBuilder<NotificationsController>(
      builder:
          (controller) => GestureDetector(
            onTap: () {
              if (appRouter.current.route.name == NotificationRoute.name) return;
              controller.onNotificationTap();
              appRouter.push(const NotificationRoute());
            },
            child: _buildNotificationIcon(notificationCount: controller.totalUnreadNotification),
          ),
    ),
    12.width,
    const CommonLanguageSlector(),
    16.width,
  ];

  Widget _buildNotificationIcon({required int notificationCount, double iconSize = 24, Color? iconColor}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(Icons.notifications_none, color: iconColor ?? Colors.black, size: iconSize),
        if (notificationCount > 0)
          Positioned(
            right: -4,
            top: -4,
            child: Container(
              padding: const EdgeInsets.all(2),
              constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
              decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              alignment: Alignment.center,
              child: Text(
                notificationCount > 99 ? '99+' : '$notificationCount',
                style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          ),
      ],
    );
  }
}
