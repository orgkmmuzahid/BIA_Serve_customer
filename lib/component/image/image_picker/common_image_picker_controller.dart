import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class CommonImagePickerController extends GetxController {
  bool isMulti = false;

  final List<XFile> selectedImages = [];

  final ImagePicker _picker = ImagePicker();

  void onPickerChange({required bool isMulti}) {
    this.isMulti = isMulti;
    selectedImages.clear();
  }

  void pickImage() async {
    if (isMulti) {
      final files = await _picker.pickMultiImage();
      if (files.isEmpty) {
        return;
      }

      final existingNames = selectedImages.map((img) => p.basename(img.path)).toSet();
      final newFiles =
          files.where((file) {
            final name = p.basename(file.path);
            return !existingNames.contains(name);
          }).toList();

      if (newFiles.isNotEmpty) {
        selectedImages.addAll(newFiles);
        update();
      }
    } else {
      final file = await _picker.pickImage(source: ImageSource.gallery);
      if (file == null) {
        return;
      }

      selectedImages
        ..clear()
        ..add(file);
      update();
    }
  }

  void removeImage(int index) {
    selectedImages.removeAt(index);
    update();
  }

  @override
  void dispose() {
    selectedImages.clear();
    super.dispose();
  }
}
