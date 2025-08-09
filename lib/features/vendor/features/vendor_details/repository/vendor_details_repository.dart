// File: vendor_details_repository.dart

import 'package:bai_serve_customer/config/network/dio_service.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/model/product_details_model.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/model/product_model.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/model/vendor_proof_model.dart';

abstract class VendorDetailsRepository {
  Future<List<ProductModel>> products({required int page});
  Future<ProductDetailsModel> productDetails({required String productId});
  Future<List<VendorProofModel>> fetchVendorProof();
}
