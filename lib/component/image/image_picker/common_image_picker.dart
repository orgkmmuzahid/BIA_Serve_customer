import 'dart:io';
import 'package:bai_serve/component/image/image_picker/common_image_picker_controller.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonImagePicker extends StatelessWidget {

  CommonImagePicker({super.key, this.isMulti = false}){
    Get.find<CommonImagePickerController>().onPickerChange(isMulti: isMulti);
  }
  final bool isMulti;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommonImagePickerController>(
      builder: (controller) {
        final images = controller.selectedImages;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isMulti)
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  // All selected images
                  for (int i = 0; i < images.length; i++)
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(images[i].path),
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => controller.removeImage(i),
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.black54,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.close, size: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),

                  // Add image placeholder
                  GestureDetector(
                    onTap: controller.pickImage,
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: theme.colorScheme.surfaceContainerLowest,
                      ),
                      child: const Center(
                        child: Icon(Icons.add_a_photo, size: 28),
                      ),
                    ),
                  ),
                ],
              )
            else
              Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 160,
                            height: 160,
                            color: theme.colorScheme.surfaceContainerLowest,
                            child: images.isNotEmpty
                                ? Image.file(
                                    File(images.first.path),
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.image, size: 60),
                          ),
                        ),
                        if (images.isNotEmpty)
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: controller.pickImage,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  color: Colors.black54,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.edit, color: Colors.white, size: 20),
                              ),
                            ),
                          ),
                      ],
                    ),
                    if (images.isEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ElevatedButton.icon(
                          onPressed: controller.pickImage,
                          icon: const Icon(Icons.add_photo_alternate_outlined),
                          label: const Text(AppString.addImage),
                        ),
                      ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
