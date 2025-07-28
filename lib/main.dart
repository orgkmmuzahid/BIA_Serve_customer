import 'package:bai_serve/config/bloc/app_bloc_observer.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
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
