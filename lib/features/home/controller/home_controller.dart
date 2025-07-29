import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bai_serve/config/network/request_state.dart';
import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
import 'package:bai_serve/features/home/repository/home_repository.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/log/app_log.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeRepository homeRepository = Get.find();

  RequestState<List<String>> bannerUrls = RequestState(data: []);

  String name = 'Km Muzahid';
  String address = '1901 Thornridge Cir. Shiloh, Hawaii 81063';

  int selectedNavMenu = 0;

  TextEditingController searchController = TextEditingController();
  MapEntry<String, String> selectedCountry = const MapEntry(AppString.langEnglish, AppImages.langEnglish);

  Map<String, String> availableCountries = {
    AppString.langEnglish: AppImages.langEnglish,
    AppString.langSwahili: AppImages.langSwahili,
  };

  int currentIndex = 0;

  Timer? _timer;

  void _startTimer() {
    if (bannerUrls.data.isEmpty == true) {
      return;
    }
    Timer.periodic(const Duration(seconds: 3), (timer) {
      _timer = timer;

      if (currentIndex < (bannerUrls.data.length) - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      if (appRouter.current.name == HomeRoute.name) {
        update();
      }
    });
  }

  void fetchBannerUrls() async {
    homeRepository.bannerUrls(
      onStateChange: (state) {
        bannerUrls = state;
        _timer?.cancel();
        _timer = null;
        _startTimer();
        update();
      },
    );
  }

  void onCountryChange(MapEntry<String, String> country) {
    selectedCountry = country;
    update();
  }

  void onSearch() {}

  //drawer

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    fetchBannerUrls();
    AppLogger.debug('Home controller init', tag: 'Banner timer.');
    super.onInit();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    AppLogger.debug('Home controller disposed', tag: 'Banner timer.');
    super.dispose();
  }
}
