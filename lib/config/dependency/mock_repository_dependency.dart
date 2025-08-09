import 'package:bai_serve_customer/config/dependency/dependency_injection.dart';
import 'package:bai_serve_customer/features/home/repository/home_repository.dart';
import 'package:bai_serve_customer/features/home/repository/mock_home_repository.dart';
import 'package:bai_serve_customer/features/order/tracking_order/repository/mock_tracking_order_repository.dart';
import 'package:bai_serve_customer/features/order/tracking_order/repository/tracking_order_repository.dart';
import 'package:bai_serve_customer/features/return_product/repository/mock_return_product_repository.dart';
import 'package:bai_serve_customer/features/return_product/repository/return_product_repository.dart';
import 'package:bai_serve_customer/features/vendor/common_widget/category_selector/category_selctor_repository.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/repository/mock_vendor_details_repository.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/repository/vendor_details_repository.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_sourcing/repository/mock_vendor_sourcing_repository.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_sourcing/repository/vendor_sourcing_repository.dart';
import 'package:bai_serve_customer/features/vendor/features/verify_vendor/repository/mock_verify_vendor_repository.dart';
import 'package:bai_serve_customer/features/vendor/features/verify_vendor/repository/verify_vendor_repository.dart';
import 'package:bai_serve_customer/payment/repository/mock_payment_repository.dart';
import 'package:bai_serve_customer/payment/repository/payment_repository.dart';
import 'package:bai_serve_customer/utils/log/app_log.dart';
import 'package:get/get.dart';

class MockRepositoryDependency {
  static void dependencies() {
    Get.lazyPut<VendorSourcingRepository>(MockVendorSourcingRepository.new, fenix: true);
    Get.lazyPut<HomeRepository>(MockHomeRepository.new, fenix: true);

    //get it
    getIt.registerLazySingleton<VerifyVendorRepository>(MockVerifyVendorRepository.new);
    getIt.registerLazySingleton<CategorySelctorRepository>(MockCategorySelctorRepository.new);
    getIt.registerLazySingleton<ReturnProductRepository>(MockReturnProductRepository.new);
    getIt.registerLazySingleton<PaymentRepository>(MockPaymentRepository.new);
    getIt.registerLazySingleton<TrackingOrderRepository>(MockTrackingOrderRepository.new);
    getIt.registerLazySingleton<VendorDetailsRepository>(MockVendorDetailsRepository.new);

    AppLogger.debug('Mock repository dependency initalized', tag: 'dependency');
  }
}
