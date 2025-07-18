// File: vendor_sourcing_controller.dart

import 'package:bai_serve/config/api/repository.dart';
import 'package:bai_serve/features/vendor_sourcing/model/product_model.dart';
import 'package:bai_serve/features/vendor_sourcing/model/vendor_model.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:get/get.dart';

// Get.lazyPut(() => VendorSourcingController(), fenix: true);

class VendorSourcingController extends GetxController {

  List<String> vendorCategories = [
    "Woman Shoes",
    "Men Shoes",
  ];

  String selectedVendorCategory =  "Woman Shoes";

  List<VendorModel> vendors = [
    VendorModel(id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner),
    VendorModel(id: 'id', name: 'Courtney Henry', image: AppImages.loyaltyPonitsBackground),
    VendorModel(id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner),
    VendorModel(id: 'id', name: 'Courtney Henry', image: AppImages.loyaltyPonitsBackground),
    VendorModel(id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner),
    VendorModel(id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner),
    VendorModel(id: 'id', name: 'Courtney Henry', image: AppImages.loyaltyPonitsBackground),
    VendorModel(id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner),
    VendorModel(id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner),
    VendorModel(id: 'id', name: 'Kathryn Murphy', image: AppImages.homeBanner),
  ]; 

  List<ProductModel> products = [
    ProductModel(id: 'id', name: 'Premium Quality Stylish Woman Shoes', image: AppImages.homeBanner, price: 1200),
    ProductModel(id: 'id', name: 'Premium Quality Stylish Woman Shoes', image: AppImages.homeBanner, price: 1200),
    ProductModel(id: 'id', name: 'Premium Quality Stylish Woman Shoes', image: AppImages.homeBanner, price: 1200),
    ProductModel(id: 'id', name: 'Premium Quality Stylish Woman Shoes', image: AppImages.homeBanner, price: 1200),
    ProductModel(id: 'id', name: 'Premium Quality Stylish Woman Shoes', image: AppImages.homeBanner, price: 1200),
    ProductModel(id: 'id', name: 'Premium Quality Stylish Woman Shoes', image: AppImages.homeBanner, price: 1200),
    ProductModel(id: 'id', name: 'Premium Quality Stylish Woman Shoes', image: AppImages.homeBanner, price: 1200),
    ProductModel(id: 'id', name: 'Premium Quality Stylish Woman Shoes', image: AppImages.homeBanner, price: 1200),
    ProductModel(id: 'id', name: 'Premium Quality Stylish Woman Shoes', image: AppImages.homeBanner, price: 1200),
  ];


  void onProductCategoryFetch()async{
    Repository.vendorSourcingRepository.fetchProductCategory().then((value){
      vendorCategories.addAll(value);
      update();
    });
  }


  void onVendorCategoryChange(String vendorCategory){
    selectedVendorCategory = vendorCategory;
    update();
  }
  
}