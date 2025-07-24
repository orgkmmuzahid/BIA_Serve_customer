import 'dart:io';
import 'package:bai_serve/component/image/image_picker/common_image_picker_controller.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CommonMultiImagePicker extends StatelessWidget {

  CommonMultiImagePicker({super.key, this.isMulti = true}){
    Get.find<CommonImagePickerController>().onPickerChange(isMulti: isMulti);
  }

  final bool isMulti;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommonImagePickerController>(
      builder: (controller) {
        final images = controller.selectedImages;

        return  _multiImage(images, controller);
      },
    );
  }


Container _multiImage(List<XFile> images, CommonImagePickerController controller) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: getTheme.dividerColor.withAlpha(20),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: getTheme.inputDecorationTheme.enabledBorder?.borderSide.color ?? AppColors.disable,)
    ),
    child: LayoutBuilder(
      builder: (_, constrains) {

        final double size = (constrains.maxWidth / 3) -10;

        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            // Display selected images
            for (int i = 0; i < images.length; i++)
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(8),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        File(images[i].path),
                        width: size,
                        height: size,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -6,
                    right: -6,
                    child: GestureDetector(
                      onTap: () => controller.removeImage(i),
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor3,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.lightRead,
                              blurRadius: 4,
                              spreadRadius: 1
                            ),
                          ],
                        ),
                        child: const Icon(Icons.close, size: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
        
            // Add image placeholder
            GestureDetector(
              onTap: controller.pickImage,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6), // Soft neutral background
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFFE0E0E0), // Slightly darker border
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(5),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(Icons.add_a_photo_outlined, size: 26, color: Colors.grey),
                ),
              ),
            ),
          ],
        );
      }
    ),
  );
}



}
