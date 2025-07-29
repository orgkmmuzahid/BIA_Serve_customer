import 'package:bai_serve/features/return_product/model/pickup_address_model.dart';
import 'package:bai_serve/features/return_product/model/return_product_model.dart';

import 'return_product_repository.dart';

//Get.lazyPut<ReturnProductRepository>(RealReturnProductRepository.new, fenix: true);
class RealReturnProductRepository implements ReturnProductRepository {
  @override
  Future<List<ReturnProductModel>> fetchReturnProduct() {
    // TODO: implement fetchReturnProduct
    throw UnimplementedError();
  }

  @override
  Future<PickupAddressModel> getPickupAddress() {
    // TODO: implement getPickupAddress
    throw UnimplementedError();
  }
}
