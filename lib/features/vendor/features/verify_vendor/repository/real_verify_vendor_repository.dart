import 'package:bai_serve/config/network/dio_service.dart';

import 'package:bai_serve/features/vendor/common_model/vendor_model.dart';
import 'package:bai_serve/features/vendor/common_widget/category_selector/category_model.dart';

import 'verify_vendor_repository.dart';

//Get.lazyPut<VerifyVendorRepository>(RealVerifyVendorRepository.new, fenix: true);
class RealVerifyVendorRepository implements VerifyVendorRepository {
  @override
  Future<List<VendorModel>> vendors({CategoryModel? productCategory, VerificationStatus? filterByVerification}) {
    // TODO: implement vendors
    throw UnimplementedError();
  }
}
