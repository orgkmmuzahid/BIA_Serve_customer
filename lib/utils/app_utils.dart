import 'dart:io';
import 'dart:ui' as ui;

import 'package:bai_serve/utils/log/app_log.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

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

static String formatDateTimeToHms(DateTime dateTime) {
  final hours = dateTime.hour.toString().padLeft(2, '0');
  final minutes = dateTime.minute.toString().padLeft(2, '0');
  final seconds = dateTime.second.toString().padLeft(2, '0');

  return '$hours:$minutes:$seconds';
}
static String formatDurationToHms(Duration duration) {
  final hours = duration.inHours.toString().padLeft(2, '0');
  final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
  final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');

  return '$hours:$minutes:$seconds';
}

static Future<String?> takeScreenshot(GlobalKey key) async {
  try {
    final context = key.currentContext;
    if (context == null) {
      AppLogger.error("context is null", tag: "Screenshot");
      return null;
    }

    final renderObject = context.findRenderObject();
    if (renderObject is! RenderRepaintBoundary) {
      AppLogger.error("Not a RenderRepaintBoundary", tag: "Screenshot");
      return null;
    }

    final boundary = renderObject;
    final pixelRatio = MediaQuery.of(context).devicePixelRatio;
    final image = await boundary.toImage(pixelRatio: pixelRatio);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    if (byteData == null) {
      AppLogger.error("byteData is null", tag: "Screenshot");
      return null;
    }

    final pngBytes = byteData.buffer.asUint8List();

    final directory = await getApplicationDocumentsDirectory();
    final String path = '${directory.path}/screenshot_${DateTime.now().millisecondsSinceEpoch}.png';
    final file = File(path);
    await file.writeAsBytes(pngBytes);

    AppLogger.debug('Screenshot saved to ${file.path} Size: ${await file.length()} byte', tag: 'Screenshot');
    
    return path;
  } catch (e) {
    AppLogger.error(e.toString(), tag: "Screenshot");
  }
}




static String formatTime(DateTime time) {
  return DateFormat.jm().format(time); // 'jm' = e.g., 8:00 PM
}

static String formatDateToShortMonth(DateTime dateTime) {
  const List<String> monthAbbr = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  final String day = dateTime.day.toString().padLeft(2, '0');
  final String month = monthAbbr[dateTime.month - 1];
  final String year = dateTime.year.toString();

  return '$day $month $year';
}



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
