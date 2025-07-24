// File: vendor_details_screen.dart



import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/common/vendor_avater_widget.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/vendor/vendor_details/controllers/vendor_details_controller.dart';
import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/vendor_model.dart';
import 'product_gridview_widget.dart';

/// Navigate to: `VendorDetailsScreen`
// static const String vendorDetails = "/vendor_details_screen.dart";
// GetPage(name: vendorDetails, page: () => const VendorDetailsScreen()),

class VendorDetailsScreen extends StatelessWidget {
  VendorDetailsScreen({super.key}): vendorModel = getArgument(name: 'vendorModel');

  final VendorModel? vendorModel;


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CommonAppBar(),
    body: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: GetBuilder<VendorDetailsController>(
        builder:
            (vendorController) => Stack(
              children: [
                if(vendorModel != null)
                _vendorDetails(vendorModel!),
                //message button
                Positioned(
                  bottom: 20,
                  right: 5,
                  child: CommonButton(
                    titleText: AppString.message,
                    buttonWidth: 140,
                    icon: const Icon(
                      Icons.message,
                      color: AppColors.iconColorWhite,
                    ),
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

  Widget _vendorDetails(VendorModel model) {
    return Column(
      children: [
          VendorAvaterWidget(
            model: model,
            width: 100,
            height: 120,
            style: getTheme.textTheme.titleMedium,
            isFixedNameWidth: false,
          ),
          if(model.verificationStatus == VerificationStatus.unverified)
          CommonButton(titleText: AppString.verifyNow,
           buttonWidth: 100,
           buttonHeight: 30,
           buttonRadius: 8,
           buttonColor: AppColors.primaryColor2,
           titleSize: 12,
           onTap: () {
            Get.toNamed(AppRoutes.vendorVerifyForm, arguments: {'vendorModel': model});
          },),

        20.height,

        const Expanded(
          child: ProductGridviewWidget(enableProductScrolling: true),
        ),
      ],
    );
  }
}
