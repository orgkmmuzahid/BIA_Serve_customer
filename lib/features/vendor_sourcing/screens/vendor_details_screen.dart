import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/vendor_sourcing/controllers/vendor_sourcing_controller.dart';
import 'package:bai_serve/features/vendor_sourcing/widgets/product_gridview_widget.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorDetailsScreen extends StatelessWidget {
  const VendorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CommonAppBar(),
    body: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: GetBuilder<VendorSourcingController>(
        builder:
            (vendorController) => Stack(
              children: [
                _vendorDetails(vendorController),
                //message button
                Positioned(
                  bottom: 20,
                  right: 5,
                  child: CommonButton(
                    titleText: AppString.message,
                    buttonWidth: 140,
                    icon: const Icon(Icons.message, color: AppColors.iconColorWhite),
                    buttonColor: AppColors.primaryColor3,
                    onTap: () {
                      Get.toNamed(AppRoutes.chat);
                    },
                  ),
                ),
              ],
            ),
      ),
    ),
  );

  Widget _vendorDetails(VendorSourcingController vendorController) {
    return Column(
      children: [
        CommonImage(imageSrc: vendorController.selectedVendor?.image ?? '', size: 90, borderRadius: 90, fill: BoxFit.fill).center,
        CommonText(
          text: vendorController.selectedVendor?.name ?? '',
          style: theme.textTheme.titleMedium,
          alignment: MainAxisAlignment.center,
        ),
        CommonText(
          text: vendorController.selectedVendor?.verificationStatus ?? '',
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          alignment: MainAxisAlignment.center,
        ),
    
        20.height,
    
        const Expanded(child: ProductGridviewWidget(enableProductScrolling: true)),
      ],
    );
  }
}
