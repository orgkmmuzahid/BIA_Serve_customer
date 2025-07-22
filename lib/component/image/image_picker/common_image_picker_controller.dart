import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CommonImagePickerController extends GetxController {

  bool isMulti = false;

  final List<XFile> _selectedImages = [];

  List<XFile> get selectedImages => _selectedImages;

  final ImagePicker _picker = ImagePicker();

  void onPickerChange({required bool isMulti}){
    this.isMulti = isMulti;
  }

  Future<void> pickImage() async {
    if (isMulti) {
      final List<XFile> files = await _picker.pickMultiImage();

      if (files.isNotEmpty) {
        _selectedImages.addAll(files); // ✅ Append, not replace
        update();
      }
    } else {
      final XFile? file = await _picker.pickImage(source: ImageSource.gallery);

      if (file != null) {
        _selectedImages
          ..clear()
          ..add(file); // ✅ Single: replace
        update();
      }
    }
  }

  void removeImage(int index) {
    _selectedImages.removeAt(index);
    update();
  }
}
