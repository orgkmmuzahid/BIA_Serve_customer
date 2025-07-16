import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class CommonMultiimagePickerController extends GetxController {
     List<String> selectedImagesPath = [];
   late ImagePicker _picker = ImagePicker();
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
  @override
  void onInit() {
     selectedImagesPath = [];
    _picker = ImagePicker();
    super.onInit();
  }

  @override
  void dispose() {
    selectedImagesPath.clear();
    super.dispose();
  }
}