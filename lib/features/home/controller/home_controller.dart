import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String name = 'Shakir Ahmed';
  String address = '1901 Thornridge Cir. Shiloh, Hawaii 81063';

  int selectedNavMenu = 0;

  TextEditingController searchController = TextEditingController();
  MapEntry<String, String> selectedCountry = const MapEntry(
    AppString.langEnglish,
    AppImages.langEnglish,
  );

  Map<String, String> availableCountries = {
    AppString.langEnglish: AppImages.langEnglish,
    AppString.langSwahili: AppImages.langSwahili,
  };

  void onCountryChange(MapEntry<String, String> country) {
    selectedCountry = country;
    update();
  }

  void onNavMenuChange(int index) {
    if (index == selectedNavMenu) return;
    if (index == 0) {
      goToScreen(AppRoutes.home);
    } else if (index == 1) {
      goToScreen(AppRoutes.myOrder);
    } else if (index == 2) {
      goToScreen(AppRoutes.trackingOrder);
    } else if (index == 3) {
      goToScreen(AppRoutes.setting);
    }
    selectedNavMenu = index;
    update();
  }

  void onSearch() {}

  void onPlaceOrder() {
    goToScreen(AppRoutes.placeOrder);
  }

  void onVendorSourcing() {
    Get.toNamed(AppRoutes.vendorSourcing);
  }

  void onPurchaseAndDelivery() {
    Get.toNamed(AppRoutes.purchaseDelivery);
  }

  void onBulkOrderAgents() {
    Get.toNamed(AppRoutes.bulkOrder);
  }

  void onVerifyVendor() {}

  void onDoorToDoorPickup() {
    Get.toNamed(AppRoutes.doorToDoorPickup);
  }

  //drawer
  void onDrawerReturnProduct() {}
  void onDrawerLoyaltyPoints() {
    goToScreen(AppRoutes.loyaltyPoints);
  }

  void onDrawerMessage() {
    Get.toNamed(AppRoutes.messageScreen);
  }

  void onDrawerMyPayment() {
    Get.toNamed(AppRoutes.myPayment);
  }

  void onDrawerSupport() {
    Get.toNamed(AppRoutes.chat);
  }

  void onDrawerLanguage() {
    Get.toNamed(AppRoutes.language);
  }

  void onDrawerDeleteAccount() {}
  void onDrawerLogout() {}

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
