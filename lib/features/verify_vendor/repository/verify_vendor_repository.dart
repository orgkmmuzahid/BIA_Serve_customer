// File: verify_vendor_repository.dart

import 'package:bai_serve/config/network/dio_service.dart';
import 'package:bai_serve/features/vendor_sourcing/model/vendor_model.dart';

enum VendorFetchType { allVendor, verifiedVendor, newVendor }

abstract class VerifyVendorRepository {
  Future<void> vendors({
    required String productCategory,
    required OnRequestStateChange<List<VendorModel>> onStateChange,
    VendorFetchType vendorFetchType = VendorFetchType.allVendor,
  });
}
