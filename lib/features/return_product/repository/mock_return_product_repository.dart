import 'package:bai_serve/features/return_product/model/return_product_model.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/helpers/simulate_moc_repo.dart';

import 'return_product_repository.dart';

//Get.lazyPut<ReturnProductRepository>(MockReturnProductRepository.new, fenix: true);
class MockReturnProductRepository implements ReturnProductRepository {
  @override
  Future<List<ReturnProductModel>> fetchReturnProduct() async {
    await SimulateMocRepo();
    return [
      for (int i = 0; i < 10; i++)
        ReturnProductModel(
          id: i.toString(),
          name: 'Comfort XL $i',
          orderPlacedAt: DateTime.now(),
          pickedUpAt: DateTime.now(),
          inTransit: DateTime.now(),
          quantity: 5 + i,
          image: AppImages.callingBackground,
          totalPrice: 5552,
        ),
    ];
  }
}
