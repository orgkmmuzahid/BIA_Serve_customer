import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'constants/app_colors.dart';

class Utils {

   static late var DeviceSize;
  static void successSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: AppColors.white,
      backgroundColor: AppColors.black,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void errorSnackBar(dynamic title, String message) {
    Get.snackbar(
      kDebugMode ? title.toString() : "Oops",
      message,
      colorText: AppColors.white,
      backgroundColor: AppColors.red,
      snackPosition: SnackPosition.TOP,
    );
  }

 static String formatDateTime(DateTime dateTime) {
  final dateFormat = DateFormat('MMMM d, h:mm a');
  return dateFormat.format(dateTime);
}
}
