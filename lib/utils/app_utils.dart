import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'constants/app_colors.dart';
 bool _navigating = false;
 
 void goToScreen(String route) {
  // if (_navigating) return;

  // _navigating = true;
  Get.toNamed(route)?.then((_) {
    // _navigating = false;
  });
}

class Utils {

   static late Size deviceSize;


  static void successSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: AppColors.serfeceBG,
      backgroundColor: AppColors.primaryText,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void errorSnackBar(dynamic title, String message) {
    Get.snackbar(
      kDebugMode ? title.toString() : "Oops",
      message,
      colorText: AppColors.serfeceBG,
      backgroundColor: AppColors.error,
      snackPosition: SnackPosition.TOP,
    );
  }

 static String formatDateTime(DateTime dateTime) {
  final dateFormat = DateFormat('MMMM d, h:mm a');
  return dateFormat.format(dateTime);
}
}
