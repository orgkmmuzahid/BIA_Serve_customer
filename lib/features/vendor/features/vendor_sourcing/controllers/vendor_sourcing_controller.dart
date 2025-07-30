// File: vendor_sourcing_controller.dart
import 'package:bai_serve_customer/features/vendor/features/vendor_sourcing/repository/vendor_sourcing_repository.dart';
import 'package:get/get.dart';

// Get.lazyPut(() => VendorSourcingController(), fenix: true);

class VendorSourcingController extends GetxController {
  VendorSourcingRepository vendorSourcingRepository = Get.find();

  Map<String, double> serviceFee = {'1-3': 1000.5, '4-5': 5000};

  MapEntry<String, double> selectedServiceFee = const MapEntry('1-3', 1000.5);

  void onServiceFeeSelection(MapEntry<String, double> serviceFee) {
    selectedServiceFee = serviceFee;
    update();
  }

  @override
  void onInit() {
    // fetchMyVendors();
    super.onInit();
  }
}
