// File: vendor_sourcing_repository.dart


import 'package:bai_serve/features/vendor_sourcing/model/product_details_model.dart';
import 'package:bai_serve/features/vendor_sourcing/model/product_model.dart';
import 'package:bai_serve/features/vendor_sourcing/model/vendor_model.dart';

import '../../../config/network/dio_service.dart';

abstract class VendorSourcingRepository {
  Future<void> myVendors({ required OnRequestStateChange<List<VendorModel>> onStateChange});
  Future<void> products({ required OnRequestStateChange<List<ProductModel>> onStateChange});
  Future<void> productDetails({required OnRequestStateChange<ProductDetailsModel> onStateChange});
  Future<void> productCategories({required OnRequestStateChange<List<String>> onStateChange});
}