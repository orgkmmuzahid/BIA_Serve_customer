// File: vendor_details_repository.dart

import 'package:bai_serve/config/network/dio_service.dart';
import 'package:bai_serve/features/vendor/features/vendor_details/model/product_details_model.dart';
import 'package:bai_serve/features/vendor/features/vendor_details/model/product_model.dart';
import 'package:bai_serve/features/vendor/features/vendor_details/model/vendor_proof_model.dart';

abstract class VendorDetailsRepository {
  Future<void> products({required OnRequestStateChange<List<ProductModel>> onStateChange});
  Future<void> productDetails({required OnRequestStateChange<ProductDetailsModel> onStateChange});
  Future<void> productCategories({required OnRequestStateChange<List<String>> onStateChange});
  Future<List<VendorProofModel>> fetchVendorProof();
}
