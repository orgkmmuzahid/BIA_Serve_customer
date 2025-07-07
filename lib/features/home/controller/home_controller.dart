import 'package:bai_serve/features/home/model/order_list_model.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/enum/enum.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String name = "Shakir Ahmed";
  String address = "1901 Thornridge Cir. Shiloh, Hawaii 81063";
  int notificationCount = 1;
  TextEditingController searchController = TextEditingController();
  MapEntry<String, String>? selectedCountry;
  Map<String, String> availableCountries = {AppString.langEnglish : AppImages.langEnglish, AppString.langSwahili: AppImages.langSwahili};

  List<OrderListModel> orderList = [
    OrderListModel(orderNumber: 'BIA342178', orderPlacedDate: DateTime.now(), percelPickedUp: DateTime.now(), inTransition: DateTime.now(),
     orderProgress: OrderProgress.Pending, outForDelivery: 'In Progress')
  ];

  void onCountryChange(MapEntry<String, String> country) {
    selectedCountry = country;
    update();
  }

  void onSearch(){

  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
