import 'package:bai_serve_customer/features/return_product/model/pickup_address_model.dart';
import 'package:bai_serve_customer/features/return_product/model/return_product_model.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/utils/helpers/simulate_moc_repo.dart';

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

  @override
  Future<PickupAddressModel> getPickupAddress() async {
    await SimulateMocRepo();
    return PickupAddressModel(
      name: 'Jack Taylor',
      phoneNumber: '+123456789101',
      address: '123 Maple Street ,Apt 456, Toronto, ON M5A 1A1 ,Canada',
    );
  }
}
