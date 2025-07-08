import 'package:bai_serve/config/theme/dark_theme.dart';
import 'package:bai_serve/config/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ThemeController extends GetxController {
  var themeMode = ThemeMode.light;

  void toggleTheme(ThemeMode themeMode) {
    if(this.themeMode != themeMode){
      this.themeMode = themeMode;
    }
    Get.changeTheme(themeMode == ThemeMode.light ? lightTheme : darkTheme);
  }
}
