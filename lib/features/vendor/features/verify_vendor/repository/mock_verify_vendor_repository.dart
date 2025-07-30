import 'package:bai_serve_customer/features/vendor/common_model/vendor_model.dart';
import 'package:bai_serve_customer/features/vendor/common_widget/category_selector/category_model.dart';
import 'package:bai_serve_customer/features/vendor/features/verify_vendor/model/vendor_verification_details_model.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/utils/helpers/simulate_moc_repo.dart';

import 'verify_vendor_repository.dart';

//Get.lazyPut<VerifyVendorRepository>(MockVerifyVendorRepository.new, fenix: true);
class MockVerifyVendorRepository implements VerifyVendorRepository {
  @override
  Future<List<VendorModel>> vendors({
    CategoryModel? productCategory,
    VerificationStatus? filterByVerification,
    List<VerificationStatus>? filters,
  }) async {
    final List<VerificationStatus> newFiler =
        filters?.isNotEmpty == true ? filters! : [VerificationStatus.verified, VerificationStatus.unverified];
    final List<VendorModel> list = [];
    for (int i = 0; i < newFiler.length; i++) {
      for (int j = 0; j < 5; j++)
        list.add(
          VendorModel(
            id: '522654s54f54',
            name: 'Kathryn Murphy',
            image: AppImages.homeBanner,
            status: newFiler[i],
            phoneNumber: '',
            address: '',
            applyDate: DateTime.now(),
          ),
        );
    }

    await Future.delayed(const Duration(seconds: 1));
    return list;
  }

  @override
  Future<VendorVerificationDetailsModel> verificationDetails({required String vendorId}) async {
    await SimulateMocRepo();
    return VendorVerificationDetailsModel(
      vendorName: 'Km MI',
      phoneNumber: '000001122233',
      venodorLocation: 'Vendors Location: Dar es Salam',
      verifciationFee: 5202,
      verificationStatus: VerificationStatus.pending,
      images: [AppImages.homeBanner, AppImages.callingBackground],
    );
  }
}
