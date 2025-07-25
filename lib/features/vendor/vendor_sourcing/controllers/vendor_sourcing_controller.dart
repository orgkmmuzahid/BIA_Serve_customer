// File: vendor_sourcing_controller.dart
import 'package:bai_serve/config/network/request_state.dart';
import 'package:bai_serve/features/vendor/vendor_details/model/vendor_model.dart';
import 'package:bai_serve/features/vendor/vendor_sourcing/repository/vendor_sourcing_repository.dart';
import 'package:get/get.dart';

// Get.lazyPut(() => VendorSourcingController(), fenix: true);

class VendorSourcingController extends GetxController {

  VendorSourcingRepository vendorSourcingRepository = Get.find();

  Map<String, double> serviceFee = {'1-3': 1000.5, '4-5': 5000};

  MapEntry<String, double> selectedServiceFee = const MapEntry('1-3', 1000.5);
  

  RequestState<List<VendorModel>> vendors = RequestState(data: []);


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
