import 'package:bai_serve/config/network/dio_service.dart';

import 'package:bai_serve/features/vendor_sourcing/model/vendor_model.dart';

import 'verify_vendor_repository.dart';

//Get.lazyPut<VerifyVendorRepository>(RealVerifyVendorRepository.new, fenix: true);
class RealVerifyVendorRepository implements VerifyVendorRepository {
  @override
  Future<void> vendors({
    required String productCategory,
    required OnRequestStateChange<List<VendorModel>> onStateChange,
    VendorFetchType vendorFetchType = VendorFetchType.allVendor,
  }) {
    // TODO: implement vendors
    throw UnimplementedError();
  }
}
