import 'package:bai_serve/config/app_life_cycle_management.dart';
import 'package:bai_serve/config/theme/theme_controller.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'app.dart';
import 'config/dependency/dependency_injection.dart';
import 'services/notification/notification_service.dart';
import 'services/socket/socket_service.dart';
import 'services/storage/storage_services.dart';

//create a new feature through
// mason make getx_feature --name packageName

Future<void> main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    debugPrint('Flutter error caught: ${details.exceptionAsString()}');
    FlutterError.presentError(details);
  };

  WidgetsFlutterBinding.ensureInitialized();
  await init.tryCatch();

  runApp(const MyApp());
}

Future<void> init() async {
  _diInit();
  SocketServices.connectToSocket();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    // Optionally log or report errors
  };
  await Future.wait([
    LocalStorage.getAllPrefData(),
    NotificationService.initLocalNotification(),
    dotenv.load(),
  ]);
}

void _diInit() {
  final DependencyInjection dI = DependencyInjection();
  dI.dependencies();
  Get.find<ThemeController>().initTheme();
  AppLifeCycleManagement();
}
