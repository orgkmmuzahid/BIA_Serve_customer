import 'package:bai_serve/config/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppLifeCycleManagement extends WidgetsBindingObserver {
  final ThemeController _controller = Get.find<ThemeController>();


  @override
  void didChangePlatformBrightness() {
    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    _controller.onToggleTheme(brightness);
  }
  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {

  //   super.didChangeAppLifecycleState(state);
  // }
}