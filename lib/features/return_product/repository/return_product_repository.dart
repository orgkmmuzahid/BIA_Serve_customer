// File: return_product_repository.dart

import 'package:bai_serve/features/return_product/model/return_product_model.dart';

abstract class ReturnProductRepository {
  Future<List<ReturnProductModel>> fetchReturnProduct();
}
