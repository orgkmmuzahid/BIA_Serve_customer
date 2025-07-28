import 'package:bai_serve/features/return_product/model/return_product_model.dart';

import 'return_product_repository.dart';

//Get.lazyPut<ReturnProductRepository>(RealReturnProductRepository.new, fenix: true);
class RealReturnProductRepository implements ReturnProductRepository {
  @override
  Future<List<ReturnProductModel>> fetchReturnProduct() {
    // TODO: implement fetchReturnProduct
    throw UnimplementedError();
  }
}
