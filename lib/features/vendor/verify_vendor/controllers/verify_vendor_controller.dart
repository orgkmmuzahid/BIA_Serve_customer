// File: verify_vendor_controller.dart
import 'package:bai_serve/config/network/request_state.dart';
import 'package:bai_serve/features/vendor/vendor_details/model/vendor_model.dart';
import 'package:bai_serve/features/vendor/verify_vendor/model/my_vendor_model.dart';
import 'package:bai_serve/features/vendor/verify_vendor/repository/verify_vendor_repository.dart';
import 'package:bai_serve/utils/log/app_log.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// Get.lazyPut(() => VerifyVendorController.new, fenix: true);

class VerifyVendorController extends GetxController {
  ScrollController scrollController = ScrollController();
  final VerifyVendorRepository _verifyVendorRepository = Get.find();

  List<String> vendorCategories = ['Woman Shoes', 'Men Shoes'];

  String selectedVendorCategory = 'Woman Shoes';

  RequestState<List<VendorModel>> vendors = RequestState(data: []);

  RequestState<List<MyVendorModel>> myVendors = RequestState(data: []);

  VendorFetchType vendorFetchType = VendorFetchType.allVendor;

  Future<void> fetchVendors(VendorFetchType vendorFetchType)async{
    if (vendorFetchType != this.vendorFetchType) {
      vendors = RequestState(data: []);
      this.vendorFetchType = vendorFetchType;
      update();
    }
    _verifyVendorRepository.vendors(
      productCategory: selectedVendorCategory,
      onStateChange: (state) {
        vendors.data.addAll(state.data);
        vendors= state.copyWith(data: vendors.data);
        update();
      },
    );
  }

  Future<void> fetchMyVendors({bool refresh = false}) async{
    if(refresh){
      myVendors = RequestState(data: []);
      update();
    }
    _verifyVendorRepository.myVendors(
      onStateChange: (state) {
        myVendors.data.addAll(state.data);
        myVendors= state.copyWith(data: myVendors.data);
        update();
      },
    );
  }

  void onVendorCategoryChange(String vendorCategory) {
    selectedVendorCategory = vendorCategory;
    update();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
