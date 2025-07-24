import 'package:bai_serve/config/network/dio_service.dart';
import 'package:bai_serve/config/network/request_state.dart';
import 'package:bai_serve/features/vendor/vendor_details/model/vendor_model.dart';
import 'package:bai_serve/features/vendor/vendor_sourcing/repository/vendor_sourcing_repository.dart';
import 'package:bai_serve/utils/constants/app_images.dart';

class MockVendorSourcingRepository implements VendorSourcingRepository {
  @override
  Future<void> myVendors({
    required OnRequestStateChange<List<VendorModel>> onStateChange,
  }) async {
    onStateChange(
      RequestState(
        data: [
          VendorModel(
            id: 'id',
            name: 'Kathryn Murphy',
            image: AppImages.homeBanner,
            verificationStatus: VerificationStatus.verified, phoneNumber: '',
          ),
          VendorModel(
            verificationStatus: VerificationStatus.verified,
            id: 'id',
            name: 'Courtney Henry',
            image: AppImages.loyaltyPonitsBackground, phoneNumber: '',
          ),
          VendorModel(
            verificationStatus: VerificationStatus.verified,
            id: 'id',
            name: 'Kathryn Murphy',
            image: AppImages.homeBanner, phoneNumber: '',
          ),
          VendorModel(
            verificationStatus: VerificationStatus.verified,
            id: 'id',
            name: 'Courtney Henry',
            image: AppImages.loyaltyPonitsBackground, phoneNumber: '',
          ),
          VendorModel(
            verificationStatus: VerificationStatus.verified,
            id: 'id',
            name: 'Kathryn Murphy',
            image: AppImages.homeBanner, phoneNumber: '',
          ),
          VendorModel(
            verificationStatus: VerificationStatus.unverified,
            id: 'id',
            name: 'Kathryn Murphy',
            image: AppImages.homeBanner, phoneNumber: '',
          ),
          VendorModel(
            verificationStatus: VerificationStatus.unverified,
            id: 'id',
            name: 'Courtney Henry',
            image: AppImages.loyaltyPonitsBackground, phoneNumber: '',
          ),
          VendorModel(
            verificationStatus: VerificationStatus.unverified,
            id: 'id',
            name: 'Kathryn Murphy',
            image: AppImages.homeBanner, phoneNumber: '',
          ),
          VendorModel(
            verificationStatus: VerificationStatus.unverified,
            id: 'id',
            name: 'Kathryn Murphy',
            image: AppImages.homeBanner, phoneNumber: '',
          ),
          VendorModel(
            verificationStatus: VerificationStatus.unverified,
            id: 'id',
            name: 'Kathryn Murphy',
            image: AppImages.homeBanner, phoneNumber: '',
          ),
        ],
      ),
    );
  }


}
