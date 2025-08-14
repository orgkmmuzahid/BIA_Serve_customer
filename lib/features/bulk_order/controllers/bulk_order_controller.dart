import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/features/bulk_order/model/bulk_order_details_model.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/utils/log/app_log.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BulkOrderController extends GetxController {
  List<String> selectedImagesPath = [];
  final ImagePicker _picker = ImagePicker();
  BulkOrderDetailsModel? bulkOrderDetailsModel;

  String negotiationMessage = '''Hello [Admin Name],
Thank you for reaching out with the sourcing request regarding [Product Category or Name].
Based on your requirements, here is our preliminary offer:
Product: [Product Name / Description]
Unit Price: [amount]
Minimum Order Quantity (MOQ): [quantity]
Delivery Time: [number] days
Available Variants (if any): [colors, sizes, types, etc.]''';

  Map<String, String> productItemDetails = {
    //minimum 4 required to be considered as bulk.
    'item0': '',
    'Item1': '',
    'Item2': '',
    'Item3': '',
  };

  void onBackPress() {
    productItemDetails = {
      //minimum 4 required to be considered as bulk.
      'item0': '',
      'Item1': '',
      'Item2': '',
      'Item3': '',
    };
    bulkOrderDetailsModel = null;
    appRouter.pop();
  }

  void onPromoSubmit(String promoCode) {
    AppLogger.debug('==================> Promo Code: $promoCode', tag: 'Bulk Order Controller');
    bulkOrderDetailsModel = BulkOrderDetailsModel(
      totalAmount: 11000,
      discountedAmount: 1000,
      totalPayable: 10000,
    ); //server response
    update();
  }

  void increaseItemField() {
    final String key = 'Item${productItemDetails.length}';
    productItemDetails.addIf(productItemDetails.keys.contains(key) == false, key, '');
    update();
  }

  void onItemDetailsChange(String key, String details) {
    productItemDetails[key] = details;
  }

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      // imageQuality: 85, // reduce size if needed
    );
    if (pickedFile != null) {
      if (selectedImagesPath.indexWhere((value) => value == pickedFile.path) == -1) {
        selectedImagesPath.add(pickedFile.path);
        update();
      }
    }
  }
}
