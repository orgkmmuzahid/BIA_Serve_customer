import 'package:bai_serve/config/network/dio_service.dart';
import 'package:bai_serve/config/network/request_state.dart';

import 'package:bai_serve/features/vendor_sourcing/model/vendor_model.dart';
import 'package:bai_serve/utils/constants/app_images.dart';

import 'verify_vendor_repository.dart';

//Get.lazyPut<VerifyVendorRepository>(MockVerifyVendorRepository.new, fenix: true);
class MockVerifyVendorRepository implements VerifyVendorRepository {
  @override
  Future<void> vendors({
    required String productCategory,
    required OnRequestStateChange<List<VendorModel>> onStateChange,
    VendorFetchType vendorFetchType = VendorFetchType.allVendor,
  })async {
    onStateChange(RequestState(data: [
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
        ] ));
  }
}
