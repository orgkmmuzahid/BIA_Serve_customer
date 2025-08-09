import 'package:bai_serve_customer/config/network/dio_service.dart';

import 'package:bai_serve_customer/features/vendor/features/vendor_details/model/product_details_model.dart';

import 'package:bai_serve_customer/features/vendor/features/vendor_details/model/product_model.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/model/vendor_proof_model.dart';

import 'vendor_details_repository.dart';

//Get.lazyPut<VendorDetailsRepository>(RealVendorDetailsRepository.new, fenix: true);
class RealVendorDetailsRepository implements VendorDetailsRepository {
  @override
  Future<List<VendorProofModel>> fetchVendorProof() {
    // TODO: implement fetchVendorProof
    throw UnimplementedError();
  }

  @override
  Future<ProductDetailsModel> productDetails({required String productId}) {
    // TODO: implement productDetails
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> products({required int page}) {
    // TODO: implement products
    throw UnimplementedError();
  }


}
