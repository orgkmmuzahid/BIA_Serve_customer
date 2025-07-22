import 'package:bai_serve/config/network/dio_service.dart';
import 'package:bai_serve/config/network/request_state.dart';
import 'package:bai_serve/features/vendor_sourcing/model/product_details_model.dart';
import 'package:bai_serve/features/vendor_sourcing/model/product_model.dart';
import 'package:bai_serve/features/vendor_sourcing/model/vendor_model.dart';
import 'package:bai_serve/features/vendor_sourcing/repository/vendor_sourcing_repository.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:flutter/material.dart';

class MockVendorSourcingRepository implements VendorSourcingRepository {
  @override
  Future<void> myVendors({required OnRequestStateChange<List<VendorModel>> onStateChange}) async {
    onStateChange(
      RequestState(
        data: [
          VendorModel(id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner, verificationStatus: 'Verified'),
          VendorModel(verificationStatus: 'Verified', id: 'id', name: 'Courtney Henry', image: AppImages.loyaltyPonitsBackground),
          VendorModel(verificationStatus: 'Verified', id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner),
          VendorModel(verificationStatus: 'Verified', id: 'id', name: 'Courtney Henry', image: AppImages.loyaltyPonitsBackground),
          VendorModel(verificationStatus: 'Verified', id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner),
          VendorModel(verificationStatus: 'newVendor', id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner),
          VendorModel(verificationStatus: 'Verified', id: 'id', name: 'Courtney Henry', image: AppImages.loyaltyPonitsBackground),
          VendorModel(verificationStatus: 'Verified', id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner),
          VendorModel(verificationStatus: 'Verified', id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner),
          VendorModel(verificationStatus: 'Verified', id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner),
        ],
      ),
    );
  }

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
        data: [ 'Man Fashion', 'Watch', 'Beauty', 'T-shirt', 'Stationary', 'Electronics', 'Shoes', 'Fashion Bag'],
      ),
    );
  }
}
