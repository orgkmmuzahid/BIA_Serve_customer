import 'dart:io';

import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CommonImagePickerFormField extends FormField<List<String>> {
  CommonImagePickerFormField({
    super.key,
    super.onSaved,
    super.validator,
    this.width = 160,
    this.height = 160,
    this.borderRadious = 10,
    this.pickerIcon = Icons.image,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
    List<String> super.initialValue = const [],
  }) : super(
         builder: (FormFieldState<List<String>> field) {
           return _CommonMultiImagePickerField(
             field: field,
             width: width,
             height: height,
             borderRadious: borderRadious,
             pickerIcon: pickerIcon,
           );
         },
       );
  final double width;
  final double height;
  final double borderRadious;
  final IconData pickerIcon;
}

class _CommonMultiImagePickerField extends StatefulWidget {
  const _CommonMultiImagePickerField({
    required this.field,
    this.width = 160,
    this.height = 160,
    this.borderRadious = 10,
    this.pickerIcon = Icons.image,
  });
  final FormFieldState<List<String>> field;
  final double width;
  final double height;
  final double borderRadious;
  final IconData pickerIcon;
  @override
  State<_CommonMultiImagePickerField> createState() => _CommonMultiImagePickerFieldState();
}

class _CommonMultiImagePickerFieldState extends State<_CommonMultiImagePickerField> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _images = [];

  @override
  void initState() {
    super.initState();
    _images = widget.field.value?.map(XFile.new).toList() ?? [];
  }

  void _pickImages() async {
    final file = await _picker.pickImage(source: ImageSource.gallery);
    if (file == null) return;

    setState(() {
      _images
        ..clear()
        ..add(file);
      widget.field.didChange(_images.map((x) => x.path).toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return _singleImage();
     
  }

  Center _singleImage() {
    // Shift the camera icon more inward when the image becomes circular
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(widget.borderRadious),
                child: Container(
                  width: widget.width,
                  height: widget.height,
                  color: getTheme.colorScheme.surfaceContainerLowest,
                  child:
                      _images.isNotEmpty
                          ? Image.file(File(_images.first.path), fit: BoxFit.fill)
                          : Icon(widget.pickerIcon, size: widget.width / 1.8, color: getTheme.primaryColor),
                ),
              ),

              _buildCameraIcon(),
            ],
          ),
        ],
      ),
    );
  }

  Positioned _buildCameraIcon() {
    final isCircular = widget.borderRadious >= widget.width / 2;
    double right = 8;
    double bottom = 8;

    if (isCircular) {
      final radius = widget.width / 2;
      final offset = radius * 0.120; // ≈ 29.3% inward from the edge for diagonal safety
      right = offset;
      bottom = offset;
    }

    return Positioned(
      bottom: bottom,
      right: right,
      child: GestureDetector(
        onTap: _pickImages,
        child: Container(
          height: 30,
          width: 30,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: getTheme.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(18)),
          ),
          child: const Icon(Icons.camera_alt, color: AppColors.iconColorWhite, size: 18),
        ),
      ),
    );
  }
}
