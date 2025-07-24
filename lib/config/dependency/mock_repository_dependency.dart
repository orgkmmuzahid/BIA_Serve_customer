import 'package:bai_serve/features/home/repository/home_repository.dart';
import 'package:bai_serve/features/home/repository/mock_home_repository.dart';
import 'package:bai_serve/features/order/tracking_order/repository/mock_tracking_order_repository.dart';
import 'package:bai_serve/features/order/tracking_order/repository/tracking_order_repository.dart';
import 'package:bai_serve/features/vendor/vendor_details/repository/mock_vendor_details_repository.dart';
import 'package:bai_serve/features/vendor/vendor_details/repository/vendor_details_repository.dart';
import 'package:bai_serve/features/vendor/vendor_sourcing/repository/mock_vendor_sourcing_repository.dart';
import 'package:bai_serve/features/vendor/vendor_sourcing/repository/vendor_sourcing_repository.dart';
import 'package:bai_serve/features/vendor/verify_vendor/repository/mock_verify_vendor_repository.dart';
import 'package:bai_serve/features/vendor/verify_vendor/repository/verify_vendor_repository.dart';
import 'package:bai_serve/utils/log/app_log.dart';
import 'package:get/get.dart';

class MockRepositoryDependency {

   static void dependencies() {

     Get.lazyPut<VendorSourcingRepository>(MockVendorSourcingRepository.new, fenix: true);
     Get.lazyPut<HomeRepository>(MockHomeRepository.new, fenix: true);
     Get.lazyPut<TrackingOrderRepository>(MockTrackingOrderRepository.new, fenix: true);
     Get.lazyPut<VerifyVendorRepository>(MockVerifyVendorRepository.new, fenix: true);
     Get.lazyPut<VendorDetailsRepository>(MockVendorDetailsRepository.new, fenix: true);


      AppLogger.debug('Mock repository dependency initalized', tag: 'dependency');
  }
  
}