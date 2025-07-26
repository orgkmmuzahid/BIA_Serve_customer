import 'package:bai_serve/features/vendor/common_model/vendor_model.dart';
import 'package:bai_serve/features/vendor/common_widget/category_selector/category_model.dart';
import 'package:bai_serve/utils/constants/app_images.dart';

import 'verify_vendor_repository.dart';

//Get.lazyPut<VerifyVendorRepository>(MockVerifyVendorRepository.new, fenix: true);
class MockVerifyVendorRepository implements VerifyVendorRepository {
  @override
  Future<List<VendorModel>> vendors({CategoryModel? productCategory, VerificationStatus? filterByVerification}) async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      for (int i = 0; i < 5; i++)
        VendorModel(
          id: '522654s54f54',
          name: 'Kathryn Murphy',
          image: AppImages.homeBanner,
          status: filterByVerification ?? VerificationStatus.verified,
          phoneNumber: '',
          address: '',
          applyDate: DateTime.now(),
        ),
      for (int i = 0; i < 5; i++)
        VendorModel(
          id: '522654s54f54',
          name: 'Kathryn Murphy',
          image: AppImages.homeBanner,
          status: filterByVerification ?? VerificationStatus.unverified,
          phoneNumber: '',
          address: '',
          applyDate: DateTime.now(),
        ),
    ];
  }
}
