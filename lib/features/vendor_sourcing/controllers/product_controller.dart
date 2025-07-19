import 'package:bai_serve/features/vendor_sourcing/model/product_details_model.dart';
import 'package:bai_serve/features/vendor_sourcing/model/product_model.dart';
import 'package:bai_serve/features/vendor_sourcing/model/products_filter_model.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
   
  int selectedColorIndex = 0;
  int selectedAvailableSizeIndex = 0;

    ProductFilterModel productFilterModel = ProductFilterModel(productFilters:  [
    'All Category',
    'Man Fashion',
    'Watch',
    'Beauty',
    'T-shirt',
    'Stationary',
    'Electronics',
    'Shoes',
    'Fashion Bag',
  ], selectedFilter: 'All Category');

    ProductDetailsModel? productDetailsModel = ProductDetailsModel(
    id: 'id',
    name: 'Premium Quality Stylish Woman Shoes',
    description:
        'Step into elegance with our premium quality stylish women’s shoes — crafted for comfort, designed for impact. Perfect for any occasion, these shoes combine timeless fashion with lasting durability.',
    price: 1200,
    status: 'In Stock',
    availableSizes: [36, 37, 38, 39, 40],
    availableColors: [Colors.red, Colors.yellow, Colors.black, Colors.green, Colors.blue, Colors.amber],
    image: AppImages.homeBanner,
  );

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

  void onProductFilterSelectionChange(int index){
    productFilterModel = productFilterModel.copyWith(selectedFilter: productFilterModel.productFilters[index]);
    update();
  }

  void onColorChange(int index) {
    selectedColorIndex = index;
    update();
  }

  void onAvailableSizeChange(int index) {
    selectedAvailableSizeIndex = index;
    update();
  }

}