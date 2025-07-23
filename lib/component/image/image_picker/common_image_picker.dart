import 'dart:io';

import 'package:bai_serve/component/image/image_picker/common_image_picker_controller.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';



class CommonImagePicker extends StatelessWidget {
  CommonImagePicker({
    super.key,
    this.width = 160,
    this.height = 160,
    this.borderRadious = 10,
    this.pickerIcon = Icons.image,
  }) {
    Get.find<CommonImagePickerController>().onPickerChange(isMulti: false);
  }

  final double width;
  final double height;
  final double borderRadious;
  final IconData pickerIcon;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommonImagePickerController>(
      builder: (controller) {
        final images = controller.selectedImages;

        return _singleImage(images, controller);
      },
    );
  }

  Center _singleImage(List<XFile> images, CommonImagePickerController controller) {
    // Shift the camera icon more inward when the image becomes circular
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(borderRadious),
                child: Container(
                  width: width,
                  height: height,
                  color: getTheme.colorScheme.surfaceContainerLowest,
                  child: images.isNotEmpty
                      ? Image.file(File(images.first.path), fit: BoxFit.fill)
                      :  Icon(pickerIcon, size: width/1.8, color:  getTheme.primaryColor),
                ),
              ),

              _buildCameraIcon(controller)
            ],
          ),
        ],
      ),
    );
  }

  Positioned _buildCameraIcon( CommonImagePickerController controller) {
  final isCircular = borderRadious >= width / 2;
  double right = 8;
  double bottom = 8;

  if (isCircular) {
    final radius = width / 2;
    final offset = radius * 0.120; // ≈ 29.3% inward from the edge for diagonal safety
    right = offset;
    bottom = offset;
  }

  return Positioned(
    bottom: bottom,
    right: right,
    child: GestureDetector(
      onTap: controller.pickImage,
      child: Container(
        height: 30,
        width: 30,
        padding: const EdgeInsets.all(3),
        decoration:  BoxDecoration(
          color: getTheme.primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(18)),
        ),
        child: const Icon(Icons.camera_alt, color: AppColors.iconColorWhite, size: 18),
      ),
    ),
  );
}

}
