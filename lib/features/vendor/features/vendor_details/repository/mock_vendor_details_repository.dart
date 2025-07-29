import 'package:bai_serve/config/network/dio_service.dart';
import 'package:bai_serve/config/network/request_state.dart';
import 'package:bai_serve/features/vendor/common_model/vendor_model.dart';
import 'package:bai_serve/features/vendor/features/vendor_details/model/product_details_model.dart';
import 'package:bai_serve/features/vendor/features/vendor_details/model/product_model.dart';
import 'package:bai_serve/features/vendor/features/vendor_details/model/vendor_proof_model.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/helpers/simulate_moc_repo.dart';
import 'package:flutter/material.dart';

import 'vendor_details_repository.dart';

//Get.lazyPut<VendorDetailsRepository>(MockVendorDetailsRepository.new, fenix: true);
class MockVendorDetailsRepository implements VendorDetailsRepository {
  @override
  Future<void> productDetails({required OnRequestStateChange<ProductDetailsModel> onStateChange}) async {
    onStateChange(
      RequestState(
        data: ProductDetailsModel(
          id: 'id',
          name: 'Premium Quality Stylish Woman Shoes',
          description:
              'Step into elegance with our premium quality stylish women’s shoes — crafted for comfort, designed for impact. Perfect for any occasion, these shoes combine timeless fashion with lasting durability.',
          price: 1200,
          status: 'In Stock',
          availableSizes: [36, 37, 38, 39, 40],
          availableColors: [Colors.red, Colors.yellow, Colors.black, Colors.green, Colors.blue, Colors.amber],
          image: AppImages.homeBanner,
        ),
      ),
    );
  }

  @override
  Future<void> products({required OnRequestStateChange<List<ProductModel>> onStateChange}) async {
    onStateChange(
      RequestState(
        data: [
          ProductModel(id: 'id', name: 'Premium Quality Stylish Woman Shoes', image: AppImages.homeBanner, price: 1200),
          ProductModel(id: 'id', name: 'Premium Quality Stylish Woman Shoes', image: AppImages.homeBanner, price: 1200),
          ProductModel(id: 'id', name: 'Premium Quality Stylish Woman Shoes', image: AppImages.homeBanner, price: 1200),
          ProductModel(id: 'id', name: 'Premium Quality Stylish Woman Shoes', image: AppImages.homeBanner, price: 1200),
          ProductModel(id: 'id', name: 'Premium Quality Stylish Woman Shoes', image: AppImages.homeBanner, price: 1200),
          ProductModel(id: 'id', name: 'Premium Quality Stylish Woman Shoes', image: AppImages.homeBanner, price: 1200),
          ProductModel(id: 'id', name: 'Premium Quality Stylish Woman Shoes', image: AppImages.homeBanner, price: 1200),
          ProductModel(id: 'id', name: 'Premium Quality Stylish Woman Shoes', image: AppImages.homeBanner, price: 1200),
          ProductModel(id: 'id', name: 'Premium Quality Stylish Woman Shoes', image: AppImages.homeBanner, price: 1200),
        ],
      ),
    );
  }

  @override
  Future<void> productCategories({required OnRequestStateChange<List<String>> onStateChange}) async {
    onStateChange(
      RequestState(
        data: ['Man Fashion', 'Watch', 'Beauty', 'T-shirt', 'Stationary', 'Electronics', 'Shoes', 'Fashion Bag'],
      ),
    );
  }

  @override
  Future<List<VendorProofModel>> fetchVendorProof() async {
    await SimulateMocRepo();

    return [
      for (int i = 0; i < 5; i++)
        VendorProofModel(
          prifileLink: 'https://bia-serve.com/vendor/demo-vendor-12$i',
          vendorId: '1234567$i',
          name: 'Jerome Bell$i',
          phone: '123456789$i',
          status: VerificationStatus.verified,
          profileImage: AppImages.callingBackground,
          proofImages: [AppImages.callingBackground, AppImages.homeBanner, AppImages.callingBackground],
        ),
    ];
  }
}
