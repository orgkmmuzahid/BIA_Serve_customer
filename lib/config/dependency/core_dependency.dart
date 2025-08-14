import 'package:bai_serve_customer/config/dependency/dependency_injection.dart';
import 'package:bai_serve_customer/config/network/dio_service.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/config/storage/storage_service.dart';
import 'package:bai_serve_customer/utils/log/app_log.dart';

class CoreDependency {
  static void dependencies() {
    // Step 1: Register and wait for StorageService first
    // Register StorageService (lazy singleton with init)
    // Register StorageService as eager singleton
    getIt.registerSingletonAsync<StorageService>(() async {
      final storageService = StorageService();
      await storageService.init(); // await init during registration
      return storageService;
    });

    // Register DioService as eager singleton, depending on StorageService
    getIt.registerSingletonAsync<DioService>(() async {
      // Ensure StorageService is ready before creating DioService
      await getIt.isReady<StorageService>();

      return DioService.create(
        onLogout: () {
          appRouter.push(const LoginOptionsRoute());
        },
      );
    });

    AppLogger.debug('Core dependency initalized', tag: 'dependency');
  }
}
