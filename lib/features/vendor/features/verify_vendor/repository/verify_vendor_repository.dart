// File: verify_vendor_repository.dart

import 'package:bai_serve_customer/features/vendor/common_model/vendor_model.dart';
import 'package:bai_serve_customer/features/vendor/common_widget/category_selector/category_model.dart';
import 'package:bai_serve_customer/features/vendor/features/verify_vendor/model/vendor_verification_details_model.dart';

abstract class VerifyVendorRepository {
  Future<List<VendorModel>> vendors({CategoryModel? productCategory, List<VerificationStatus>? filters});
  Future<VendorVerificationDetailsModel> verificationDetails({required String vendorId});
}
