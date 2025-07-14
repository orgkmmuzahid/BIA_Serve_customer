import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BulkOrderController extends GetxController{
   
   List<String> selectedImagesPath = [];
  final ImagePicker _picker = ImagePicker();

  Map<String, String> productItemDetails = { //minimum 4 required to be considered as bulk.
    "item0" : "",
    "Item1" : "",
    "Item2" : "",
    "Item3" : ""
  }; 

    void onBackPress(){
      productItemDetails = { //minimum 4 required to be considered as bulk.
        "item0" : "",
        "Item1" : "",
        "Item2" : "",
        "Item3" : ""
      };
      Get.back();
    }

    void continueToAddress(){
      Get.toNamed(AppRoutes.placeOrder, arguments: {'title' : AppString.homeBulkOrderAgents});
    }

    void increaseItemField(){
      String key = "Item${productItemDetails.length}";
      productItemDetails.addIf(productItemDetails.keys.contains(key) == false ,key, "");
      update();
    }

    void onItemDetailsChange(String key, String details){
      productItemDetails[key] = details;
    }

    Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      // imageQuality: 85, // reduce size if needed
    );
    if (pickedFile != null) {
        if(selectedImagesPath.indexWhere((value)=> value == pickedFile.path)== -1) {
          selectedImagesPath.add( pickedFile.path);
          update();
        }
    }
  }
}