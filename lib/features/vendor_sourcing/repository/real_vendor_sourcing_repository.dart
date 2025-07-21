import 'package:bai_serve/config/network/dio_service.dart';
import 'package:bai_serve/features/vendor_sourcing/model/product_details_model.dart';
import 'package:bai_serve/features/vendor_sourcing/model/product_model.dart';
import 'package:bai_serve/features/vendor_sourcing/model/vendor_model.dart';
import 'package:bai_serve/features/vendor_sourcing/repository/vendor_sourcing_repository.dart';
import 'package:get/get.dart';

class RealVendorSourcingRepository implements VendorSourcingRepository {
    final DioService _dioService = Get.find<DioService>();
    
      @override
      Future<void> myVendors({required OnRequestStateChange<List<VendorModel>> onStateChange}) {
    // TODO: implement myVendors
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
      
        @override
        Future<void> productCategories({required OnRequestStateChange<List<String>> onStateChange}) {
          // TODO: implement productCategories
          throw UnimplementedError();
        }



  
}