import 'package:bai_serve/features/home/repository/home_repository.dart';
import 'package:bai_serve/features/home/repository/mock_home_repository.dart';
import 'package:bai_serve/features/vendor_sourcing/repository/mock_vendor_sourcing_repository.dart';
import 'package:bai_serve/features/vendor_sourcing/repository/vendor_sourcing_repository.dart';
import 'package:bai_serve/utils/log/app_log.dart';
import 'package:get/get.dart';

class MockRepositoryDependency {

   static void dependencies() {

     Get.lazyPut<VendorSourcingRepository>(MockVendorSourcingRepository.new, fenix: true);
     Get.lazyPut<HomeRepository>(MockHomeRepository.new, fenix: true);

      AppLogger.debug('Mock repository dependency initalized', tag: 'dependency');
  }
  
}