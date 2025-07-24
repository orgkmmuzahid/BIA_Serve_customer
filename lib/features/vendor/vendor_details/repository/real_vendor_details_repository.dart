import 'package:bai_serve/config/network/dio_service.dart';

import 'package:bai_serve/features/vendor/vendor_details/model/product_details_model.dart';

import 'package:bai_serve/features/vendor/vendor_details/model/product_model.dart';

import 'vendor_details_repository.dart';
//Get.lazyPut<VendorDetailsRepository>(RealVendorDetailsRepository.new, fenix: true);
class RealVendorDetailsRepository implements VendorDetailsRepository {
  @override
  Future<void> productCategories({required OnRequestStateChange<List<String>> onStateChange}) {
    // TODO: implement productCategories
    throw UnimplementedError();
  }

  @override
  Future<void> productDetails({required OnRequestStateChange<ProductDetailsModel> onStateChange}) {
    // TODO: implement productDetails
    throw UnimplementedError();
  }

  @override
  Future<void> products({required OnRequestStateChange<List<ProductModel>> onStateChange}) {
    // TODO: implement products
    throw UnimplementedError();
  }
  
}