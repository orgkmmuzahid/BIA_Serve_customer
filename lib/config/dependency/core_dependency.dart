import 'package:bai_serve_customer/component/image/image_picker/common_image_picker_controller.dart';
import 'package:bai_serve_customer/config/network/dio_service.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/config/storage/storage_service.dart';
import 'package:bai_serve_customer/utils/log/app_log.dart';
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
         appRouter.push(const LoginOptionsRoute());
        },
      );
    });

     Get.lazyPut(CommonImagePickerController.new, fenix: true);

    AppLogger.debug('Core dependency initalized', tag: 'dependency');
  }
}
