import 'package:bai_serve/config/network/request_state.dart';
import 'package:bai_serve/features/vendor_sourcing/model/product_details_model.dart';
import 'package:bai_serve/features/vendor_sourcing/model/product_model.dart';
import 'package:bai_serve/features/vendor_sourcing/repository/vendor_sourcing_repository.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{

  VendorSourcingRepository vendorSourcingRepository = Get.find();
   
  int selectedColorIndex = 0;
  int selectedAvailableSizeIndex = 0;

  RequestState<List<String>> categories = RequestState();
  String selectedCategory = '';

  RequestState<ProductDetailsModel> productDetailsModel = RequestState();

  RequestState<List<ProductModel>> products = RequestState() ;

  void fetchProduct()async{
    vendorSourcingRepository.products(onStateChange: (state){
      products = state;
      update();
    });
  }

  void fetchProductCategories()async{
    vendorSourcingRepository.productCategories(onStateChange: (state){
      categories = state;
      update();
    });
  }

  void onProductFilterSelectionChange(String value){
    selectedCategory = value;
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

  @override
  void onInit() {
    fetchProduct();
    fetchProductCategories();
    super.onInit();
  }

}