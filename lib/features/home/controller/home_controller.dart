
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/notifications/presentation/controller/notifications_controller.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String name = "Shakir Ahmed";
  String address = "1901 Thornridge Cir. Shiloh, Hawaii 81063";
  
  TextEditingController searchController = TextEditingController();
  MapEntry<String, String> selectedCountry = MapEntry(AppString.langEnglish , AppImages.langEnglish);
  
  Map<String, String> availableCountries = {AppString.langEnglish : AppImages.langEnglish, AppString.langSwahili: AppImages.langSwahili};

  void onCountryChange(MapEntry<String, String> country) {
    selectedCountry = country;
    update();
  }

  void onSearch(){
     
  }

  void onNotificationTap(){
    Get.find<NotificationsController>().getNotificationsRepo();
    Get.toNamed(AppRoutes.notifications);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
