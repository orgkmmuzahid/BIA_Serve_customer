import 'package:bai_serve/config/network/dio_service.dart';
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/config/storage/storage_service.dart';
import 'package:bai_serve/utils/log/app_log.dart';
import 'package:get/get.dart';

class CoreDependency {
  static void dependencies() {
    // Step 1: Register and wait for StorageService first
    Get.lazyPut<StorageService>((){
      final storageService = StorageService();
      storageService.init();
      return storageService;
    });

    // Step 2: Chain DioService registration after StorageService is available
    Get.putAsync<DioService>(() {
      return DioService.create(
        onLogout: () {
          Get.toNamed(AppRoutes.loginWith);
        },
      );
    });

    AppLogger.debug('Core dependency initalized', tag: 'dependency');
  }
}
