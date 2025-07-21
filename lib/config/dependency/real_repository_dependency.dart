import 'package:bai_serve/features/home/repository/home_repository.dart';
import 'package:bai_serve/features/home/repository/real_home_repository.dart';
import 'package:bai_serve/features/vendor_sourcing/repository/real_vendor_sourcing_repository.dart';
import 'package:bai_serve/features/vendor_sourcing/repository/vendor_sourcing_repository.dart';
import 'package:bai_serve/utils/log/app_log.dart';
import 'package:get/get.dart';

class RealRepositoryDependency {
   static void dependencies() {
     Get.lazyPut<VendorSourcingRepository>(RealVendorSourcingRepository.new, fenix: true);
     Get.lazyPut<HomeRepository>(RealHomeRepository.new, fenix: true);

      AppLogger.debug('Real repository dependency initalized', tag: 'dependency');
  }
}