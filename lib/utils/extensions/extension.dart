import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/utils/log/error_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as screenutil;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

ThemeData get getTheme => Theme.of(appRouter.globalRouterKey.currentContext!);

extension EnumDisplayName on Enum {
  String get displayName {
    final raw = name;
    final spaced = raw.replaceAllMapped(
      RegExp(r'([A-Z])'),
      (match) => ' ${match.group(0)}',
    );

    return spaced[0].toUpperCase() + spaced.substring(1);
  }
}

extension pointLat on LatLng {
  PointLatLng get pointLatLng => PointLatLng(latitude, longitude);
}

extension strting on String {
  String get newLine => '$this\n';
}

extension View on num {
  Widget get height => SizedBox(height: toDouble().h);

  Widget get width => SizedBox(width: toDouble().w);
}

// All Alignments Extensions

extension Alignments on Widget {
  Widget get start => Align(alignment: Alignment.centerLeft, child: this);

  Widget get end => Align(alignment: Alignment.centerRight, child: this);

  Widget get center => Align(child: this);
}

// All Alignments Time Formatter Extensions
extension TimeFormater on DateTime {
  String get time => DateFormat('h:mm a').format(this);

  String get date => DateFormat('dd-MM-yyyy').format(this);

  String get dayName => DateFormat('E').format(this);

  String get checkTime {
    final DateTime currentDateTime = DateTime.now();

    final Duration difference = currentDateTime.difference(this);
    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return ('${difference.inMinutes} minutes ago');
      } else {
        return ('${difference.inHours} hours ago');
      }
    } else {
      final createdAtTime = toIso8601String().split('.')[0];
      final date = createdAtTime.split('T')[0];
      final time = createdAtTime.split('T')[1];
      return '$date at $time';
    }
  }
}

extension AsyncTryCatch on Function() {
  Future<void> tryCatch() async {
    try {
      await this();
    } catch (e, stackTrace) {
      errorLog(stackTrace.toString(), source: 'Global Try Catch');
    }
  }
}
