import 'dart:async';

import 'package:bai_serve_customer/config/network/response_state.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/home/repository/home_repository.dart';
import 'package:bai_serve_customer/utils/log/app_log.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeRepository homeRepository = Get.find();

  ResponseState<List<String>> bannerUrls = ResponseState(data: [], statusCode: 200);

  String name = 'Km Muzahid';
  String address = '1901 Thornridge Cir. Shiloh, Hawaii 81063';

  int selectedNavMenu = 0;

  TextEditingController searchController = TextEditingController();

  int currentIndex = 0;

  Timer? _timer;

  void onNavigationChange(int index) {
    selectedNavMenu = index;
    update();
  }

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
