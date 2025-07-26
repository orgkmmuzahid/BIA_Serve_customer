// File: verify_vendor_repository.dart

import 'package:bai_serve/features/vendor/common_model/vendor_model.dart';
import 'package:bai_serve/features/vendor/common_widget/category_selector/category_model.dart';

abstract class VerifyVendorRepository {
  Future<List<VendorModel>> vendors({CategoryModel? productCategory, VerificationStatus? filterByVerification});
}
