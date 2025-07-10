import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';


class AppLogger {
  static bool enableLogs = kDebugMode; // Only log in debug mode by default

  static final DateFormat _timeFormatter = DateFormat('HH:mm:ss');

  static void _log(String level, String message, {String? tag}) {
    if (!enableLogs) return;

    final now = DateTime.now();
    final time = _timeFormatter.format(now);
    final logTag = tag != null ? '[$tag]' : '';
    
    debugPrint('[$time] [$level] $logTag $message');
  }

  static void info(String message, {String? tag}) {
    _log('INFO', message, tag: tag);
  }

  static void warning(String message, {String? tag}) {
    _log('WARN', message, tag: tag);
  }

  static void error(String message, {String? tag}) {
    _log('ERROR', message, tag: tag);
  }

  static void debug(String message, {String? tag}) {
    _log('DEBUG', message, tag: tag);
  }
}
