import 'package:bai_serve_customer/component/search_bar/search_history_service.dart';
import 'package:bai_serve_customer/config/dependency/dependency_injection.dart';
import 'package:bai_serve_customer/features/auth/repository/auth_repository.dart';
import 'package:bai_serve_customer/features/auth/repository/real_auth_repository.dart';
import 'package:bai_serve_customer/features/home/repository/home_repository.dart';
import 'package:bai_serve_customer/features/home/repository/real_home_repository.dart';
import 'package:bai_serve_customer/features/order/tracking_order/repository/real_tracking_order_repository.dart';
import 'package:bai_serve_customer/features/order/tracking_order/repository/tracking_order_repository.dart';
import 'package:bai_serve_customer/features/return_product/repository/real_return_product_repository.dart';
import 'package:bai_serve_customer/features/return_product/repository/return_product_repository.dart';
import 'package:bai_serve_customer/features/vendor/common_widget/category_selector/category_selctor_repository.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/repository/real_vendor_details_repository.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/repository/vendor_details_repository.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_sourcing/repository/real_vendor_sourcing_repository.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_sourcing/repository/vendor_sourcing_repository.dart';
import 'package:bai_serve_customer/features/vendor/features/verify_vendor/repository/real_verify_vendor_repository.dart';
import 'package:bai_serve_customer/features/vendor/features/verify_vendor/repository/verify_vendor_repository.dart';
import 'package:bai_serve_customer/payment/repository/payment_repository.dart';
import 'package:bai_serve_customer/payment/repository/real_payment_repository.dart';
import 'package:bai_serve_customer/utils/log/app_log.dart';
import 'package:get/get.dart';

class RealRepositoryDependency {
  static void dependencies() {
    getIt.registerLazySingleton<AuthRepository>(RealAuthRepository.new);


    Get.lazyPut<VendorSourcingRepository>(RealVendorSourcingRepository.new, fenix: true);
    Get.lazyPut<HomeRepository>(RealHomeRepository.new, fenix: true);

    //getit
    getIt.registerLazySingleton<VerifyVendorRepository>(RealVerifyVendorRepository.new);
    getIt.registerLazySingleton<CategorySelctorRepository>(RealCategorySelctorRepository.new);
    getIt.registerLazySingleton<ReturnProductRepository>(RealReturnProductRepository.new);
    getIt.registerLazySingleton<PaymentRepository>(RealPaymentRepository.new);
    getIt.registerLazySingleton<TrackingOrderRepository>(RealTrackingOrderRepository.new);
    getIt.registerLazySingleton<VendorDetailsRepository>(RealVendorDetailsRepository.new);
    

    AppLogger.debug('Real repository dependency initalized', tag: 'dependency');
  }
}
