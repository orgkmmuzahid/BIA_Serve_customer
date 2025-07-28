import 'package:bai_serve/config/network/request_state.dart';
import 'package:bai_serve/features/vendor/features/vendor_details/model/product_details_model.dart';
import 'package:bai_serve/features/vendor/features/vendor_details/model/product_model.dart';
import 'package:bai_serve/features/vendor/features/vendor_details/repository/vendor_details_repository.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  VendorDetailsRepository vendorDetailsRepository = Get.find();

  int selectedColorIndex = 0;
  int selectedAvailableSizeIndex = 0;

  RequestState<List<String>> categories = RequestState(data: []);
  String selectedCategory = '';

  RequestState<ProductDetailsModel?> productDetailsModel = RequestState(data: null);

  RequestState<List<ProductModel>> products = RequestState(data: []);

  void fetchProduct() async {
    vendorDetailsRepository.products(
      onStateChange: (state) {
        products = state;
        update();
      },
    );
  }

  void fetchProductDetails() async {
    vendorDetailsRepository.productDetails(
      onStateChange: (state) {
        productDetailsModel = state;
        update();
      },
    );
  }

  void fetchProductCategories() async {
    vendorDetailsRepository.productCategories(
      onStateChange: (state) {
        categories = state;
        if (state.data.isNotEmpty == true) {
          selectedCategory = state.data.first;
        }
        update();
      },
    );
  }

  void onCategorySelection(String value) {
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
