import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/features/vendor_sourcing/controllers/vendor_sourcing_controller.dart';
import 'package:bai_serve/features/vendor_sourcing/model/vendor_model.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorWidget extends StatelessWidget {
  const VendorWidget({required this.model, super.key});

  final VendorModel model;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      Get.find<VendorSourcingController>().onVendor(model);
    },
    child: SizedBox(
      width: 70,
      height: 100,
      child: Column(
        children: [
          CommonImage(
            imageSrc: model.image,
            size: 60,
            borderRadius: 50,
            fill: BoxFit.fill,
          ),
          CommonText(
            text: model.name,
            style: getTheme.textTheme.bodyMedium?.copyWith(
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    ),
  );
}
