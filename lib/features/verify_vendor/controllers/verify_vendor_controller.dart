// File: verify_vendor_controller.dart
import 'package:bai_serve/config/network/request_state.dart';
import 'package:bai_serve/features/vendor_sourcing/model/vendor_model.dart';
import 'package:bai_serve/features/verify_vendor/repository/verify_vendor_repository.dart';
import 'package:get/get.dart';

// Get.lazyPut(() => VerifyVendorController.new, fenix: true);

class VerifyVendorController extends GetxController {
 final VerifyVendorRepository _verifyVendorRepository = Get.find();

 List<String> vendorCategories = ['Woman Shoes', 'Men Shoes'];

 String selectedVendorCategory = 'Woman Shoes';

 RequestState<List<VendorModel>> vendors = RequestState();

 VendorFetchType vendorFetchType = VendorFetchType.allVendor;

 void fetchVendors(VendorFetchType vendorFetchType){
  vendors = RequestState();
  this.vendorFetchType = vendorFetchType;
   update();
  _verifyVendorRepository.vendors(productCategory: selectedVendorCategory,
   onStateChange: (state){
    vendors = state;
    update();
   });
 }

  void onVendorCategoryChange(String vendorCategory) {
    selectedVendorCategory = vendorCategory;
    update();
  }

 @override
  void onInit() {
    fetchVendors(VendorFetchType.allVendor);
    super.onInit();
  }
}