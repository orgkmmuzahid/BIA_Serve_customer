import 'package:bai_serve/component/app_bar_actions.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/features/home/controller/home_controller.dart';
import 'package:bai_serve/features/notifications/presentation/controller/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class  CommonNotificationAppbar extends StatelessWidget implements PreferredSizeWidget{

  final String title;
  final Function()? onBackPress;

  const CommonNotificationAppbar({super.key, required this.title, this.onBackPress});
 
   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => GetBuilder<NotificationsController>(
    builder: (notificationController) {
      return AppBar(
                centerTitle: true,
                leading: IconButton(onPressed: (){
                  if(onBackPress != null) onBackPress!();
                  Get.back();
                }, icon: Icon(Icons.arrow_back_ios_new_sharp)),
                actions: _appBarBuilder(notificationController, Get.find<HomeController>()),
                title: CommonText(
                  text: title ,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                ),
              );
    }
  );
  
}

List<Widget> _appBarBuilder(NotificationsController notificationController, HomeController homeController) {
    return AppBarActions(notificationCount: notificationController.totalUnreadNotification, 
          slectedCountry: homeController.selectedCountry, availableCountries: homeController.availableCountries, onCountryChange: homeController.onCountryChange,
           onNotificationTap: homeController.onNotificationTap);
  }