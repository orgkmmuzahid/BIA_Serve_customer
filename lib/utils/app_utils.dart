import 'dart:io';
import 'dart:ui' as ui;
import 'package:bai_serve/component/other_widgets/permission_handler_helper.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/log/app_log.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


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
        AppLogger.error('context is null', tag: 'Screenshot');
        return null;
      }

      final renderObject = context.findRenderObject();
      if (renderObject is! RenderRepaintBoundary) {
        AppLogger.error('Not a RenderRepaintBoundary', tag: 'Screenshot');
        return null;
      }

      final boundary = renderObject;
      final pixelRatio = MediaQuery.of(context).devicePixelRatio;
      final image = await boundary.toImage(pixelRatio: pixelRatio);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData == null) {
        AppLogger.error('byteData is null', tag: 'Screenshot');
        return null;
      }

      final pngBytes = byteData.buffer.asUint8List();

      //permission handle
      if (await const PermissionHandlerHelper(permission: Permission.photos).getStatus() == false) {
        return null;
      }

      //save file

      final directory = await getApplicationDocumentsDirectory();
      final String path = '${directory.path}/screenshot_${DateTime.now().millisecondsSinceEpoch}.png';
      final file = File(path);
      await file.writeAsBytes(pngBytes);

      final savedStatus = await GallerySaver.saveImage(path, albumName: 'Screenshot');

      if (savedStatus == true) {
        Future.delayed(const Duration(seconds: 5)).then((v) {
          file.delete().then((v) {
            AppLogger.info('catched file image is deleted', tag: 'Screeenshot');
          });
        });
        AppLogger.debug('Screenshot saved to Gallery Size: ${await file.length()} byte', tag: 'Screenshot');
      } else {
        AppLogger.error('Something is wrong! image is not saved', tag: 'Screenshot');
      }

      return path;
    } catch (e) {
      AppLogger.error(e.toString(), tag: 'Screenshot');
    }
    return null;
  }

  static String formatTime(DateTime time) {
    return DateFormat.jm().format(time); // 'jm' = e.g., 8:00 PM
  }

  static String formatDateToShortMonth(DateTime dateTime) {
    const List<String> monthAbbr = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

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

  static void errorSnackBar(title, String message) {
    Get.snackbar(
      kDebugMode ? title.toString() : 'Oops',
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

  static Future<BitmapDescriptor> bitmapDescriptorFromIconData(
    IconData icon, {
    double size = 64,
    Color color = Colors.red,
  }) async {
    final pictureRecorder = ui.PictureRecorder();
    final canvas = Canvas(pictureRecorder);
    final textPainter = TextPainter(textDirection: material.TextDirection.ltr);

    // Paint the icon as text
    textPainter.text = TextSpan(
      text: String.fromCharCode(icon.codePoint),
      style: TextStyle(fontSize: size, fontFamily: icon.fontFamily, color: color, package: icon.fontPackage),
    );

    textPainter.layout();
    textPainter.paint(canvas, Offset.zero);

    final picture = pictureRecorder.endRecording();
    final image = await picture.toImage(size.toInt(), size.toInt());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();

    return BitmapDescriptor.bytes(pngBytes);
  }

 static String formatDouble(double value) {
    final double rounded = double.parse(value.toStringAsFixed(1));
    if (rounded == rounded.toInt()) {
      return rounded.toInt().toString();
    } else {
      return rounded.toStringAsFixed(1);
    }
  }
}
