import 'package:bai_serve/config/network/dio_service.dart';
import 'package:bai_serve/config/network/request_state.dart';

import 'package:bai_serve/features/vendor/vendor_details/model/vendor_model.dart';
import 'package:bai_serve/features/vendor/verify_vendor/model/my_vendor_model.dart';
import 'package:bai_serve/utils/constants/app_images.dart';

import 'verify_vendor_repository.dart';

//Get.lazyPut<VerifyVendorRepository>(MockVerifyVendorRepository.new, fenix: true);
class MockVerifyVendorRepository implements VerifyVendorRepository {
  @override
  Future<void> vendors({
    required String productCategory,
    required OnRequestStateChange<List<VendorModel>> onStateChange,
    VendorFetchType vendorFetchType = VendorFetchType.allVendor,
  }) async {
    onStateChange(RequestState(data: [], isRequesting: true));
    await Future.delayed(const Duration(seconds: 1));
    onStateChange(
      RequestState(
        data: [
          for(int i =0; i<5; i++)
          VendorModel(
            id: '522654s54f54',
            name: 'Kathryn Murphy',
            image: AppImages.homeBanner,
            verificationStatus: VerificationStatus.verified,
            phoneNumber: '',
          ),
          for(int i =0; i<5; i++)
          VendorModel(
            verificationStatus: VerificationStatus.unverified,
            id: '45564sdfwsadfg4',
            name: 'Kathryn Murphy',
            image: AppImages.homeBanner,
            phoneNumber: '',
          ),
        ],
      ),
    );
  }

  @override
  Future<void> myVendors({required OnRequestStateChange<List<MyVendorModel>> onStateChange}) async {
    
    onStateChange(RequestState(data: [], isRequesting: true));
    await Future.delayed(const Duration(seconds: 1));
    
    onStateChange(
      RequestState(
        data: [
          for(int i =0; i<5; i++)
          MyVendorModel(
            id: 'id',
            name: 'Kathryn Murphy',
            image: AppImages.homeBanner,
            phoneNumber: '',
            address: 'Dar es salaam',
            applyDate: DateTime.now(),
            verifyStatus: VerifyStatus.pending,
          ),
          for(int i =0; i<5; i++)
          MyVendorModel(
            id: 'id',
            name: 'Kathryn Murphy',
            image: AppImages.homeBanner,
            phoneNumber: '',
            address: 'Dar es salaam',
            applyDate: DateTime.now(),
            verifyStatus: VerifyStatus.verified,
          ),
        
        ],
      ),
    );
  }
}
