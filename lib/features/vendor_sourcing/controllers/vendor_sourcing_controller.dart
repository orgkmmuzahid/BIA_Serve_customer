// File: vendor_sourcing_controller.dart

import 'package:bai_serve/config/api/repository.dart';
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/vendor_sourcing/model/vendor_model.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:get/get.dart';

// Get.lazyPut(() => VendorSourcingController(), fenix: true);

class VendorSourcingController extends GetxController {
  Map<String, double> serviceFee = {'1-3': 1000.5, '4-5': 5000};

  MapEntry<String, double> selectedServiceFee = const MapEntry('1-3', 1000.5);

  List<String> vendorCategories = ['Woman Shoes', 'Men Shoes'];

  String selectedVendorCategory = 'Woman Shoes';

  VendorModel? selectedVendor;


  List<VendorModel> vendors = [
    VendorModel(id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner, verificationStatus: 'Verified'),
    VendorModel(verificationStatus: 'Verified', id: 'id', name: 'Courtney Henry', image: AppImages.loyaltyPonitsBackground),
    VendorModel(verificationStatus: 'Verified', id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner),
    VendorModel(verificationStatus: 'Verified', id: 'id', name: 'Courtney Henry', image: AppImages.loyaltyPonitsBackground),
    VendorModel(verificationStatus: 'Verified', id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner),
    VendorModel(verificationStatus: 'Verified', id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner),
    VendorModel(verificationStatus: 'Verified', id: 'id', name: 'Courtney Henry', image: AppImages.loyaltyPonitsBackground),
    VendorModel(verificationStatus: 'Verified', id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner),
    VendorModel(verificationStatus: 'Verified', id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner),
    VendorModel(verificationStatus: 'Verified', id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner),
  ];

  void onVendor(VendorModel model){
    selectedVendor = model;
    Get.toNamed(AppRoutes.vendorDetails);
  }


  void onServiceFeeSelection(MapEntry<String, double> serviceFee) {
    selectedServiceFee = serviceFee;
    update();
  }

  void onProductCategoryFetch() async {
    Repository.vendorSourcingRepository.fetchProductCategory().then((value) {
      vendorCategories.addAll(value);
      update();
    });
  }

  void onVendorCategoryChange(String vendorCategory) {
    selectedVendorCategory = vendorCategory;
    update();
  }
}
