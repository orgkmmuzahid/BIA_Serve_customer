// File: verify_vendor_repository.dart

import 'package:bai_serve/config/network/dio_service.dart';
import 'package:bai_serve/features/vendor/vendor_details/model/vendor_model.dart';
import 'package:bai_serve/features/vendor/verify_vendor/model/my_vendor_model.dart';

enum VendorFetchType { allVendor, verifiedVendor, newVendor }

abstract class VerifyVendorRepository {
  Future<void> vendors({
    required String productCategory,
    required OnRequestStateChange<List<VendorModel>> onStateChange,
    VendorFetchType vendorFetchType = VendorFetchType.allVendor,
  });

  Future<void> myVendors({required OnRequestStateChange<List<MyVendorModel>> onStateChange});
}
