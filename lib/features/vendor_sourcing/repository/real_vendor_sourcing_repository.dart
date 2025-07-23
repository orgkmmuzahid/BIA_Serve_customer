import 'dart:io';

import 'package:bai_serve/config/network/dio_service.dart';
import 'package:bai_serve/config/network/request_input.dart';
import 'package:bai_serve/features/vendor_sourcing/model/product_details_model.dart';
import 'package:bai_serve/features/vendor_sourcing/model/product_model.dart';
import 'package:bai_serve/features/vendor_sourcing/model/vendor_model.dart';
import 'package:bai_serve/features/vendor_sourcing/repository/vendor_sourcing_repository.dart';
import 'package:get/get.dart';

class RealVendorSourcingRepository implements VendorSourcingRepository {
  final DioService _dioService = Get.find<DioService>();

  @override
  Future<void> myVendors({required OnRequestStateChange<List<VendorModel>> onStateChange}) async {
    // _dioService.request<List<VendorModel>>(
    //   input: RequestInput(
    //     endpoint: '/api', method: RequestMethod.GET),
    //   responseBuilder: (value) => value.map((e) => VendorModel.fromJson(e)).toList(),
    //   onStateChange: onStateChange,
    // );
  }

  @override
  Future<void> productDetails({required OnRequestStateChange<ProductDetailsModel> onStateChange})async {
    // _dioService.request<ProductDetailsModel>(
    //   input: RequestInput(endpoint: '/api/product', method: RequestMethod.POST),
    //   responseBuilder: (value) => ProductDetailsModel.fromJson(value),
    //   onStateChange: onStateChange,
    // );
  }

  @override
  Future<void> products({required OnRequestStateChange<List<ProductModel>> onStateChange}) {
    // TODO: implement products
    throw UnimplementedError();
  }

  @override
  Future<void> productCategories({required OnRequestStateChange<List<String>> onStateChange}) {
    // TODO: implement productCategories
    throw UnimplementedError();
  }
}
