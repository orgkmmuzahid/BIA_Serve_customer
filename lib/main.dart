import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/bloc/app_bloc_observer.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/storage/storage_service.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';
import 'config/dependency/dependency_injection.dart';
//flutter pub run build_runner build --delete-conflicting-outputs
//dart run build_runner watch
//create a new feature through
// mason make getx_feature --name packageName
//emulator -list-avds
//emulator -avd Pixel_9a

Future<void> main() async {
  //can be comment it in release mode.
  Bloc.observer = AppBlocObserver();

  ErrorWidget.builder = (FlutterErrorDetails details) {
    debugPrint('Flutter error: ${details.exception}');
    return const Center(child: Text('Oops, something went wrong'));
  };

  WidgetsFlutterBinding.ensureInitialized();
  await init.tryCatch();
  await getIt.isReady<StorageService>();

  runApp(const MyApp());
}

Future<void> init() async {
  _diInit();
  await Future.wait([dotenv.load()]);
}

void _diInit() {
  final DependencyInjection dI = DependencyInjection();
  dI.dependencies();
}

void showSnackBar(String text) {
  ScaffoldMessenger.of(appRouter.navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 800),
      backgroundColor: AppColors.primaryColor,
      content: CommonText(text: text, color: AppColors.textWhite, fontWeight: FontWeight.bold),
    ),
  );
}
