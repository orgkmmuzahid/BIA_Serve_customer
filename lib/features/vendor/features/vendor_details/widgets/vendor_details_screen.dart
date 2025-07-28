import 'package:auto_route/auto_route.dart';
import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/common/vendor_avater_widget.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
import 'package:bai_serve/features/vendor/features/vendor_details/controllers/product_controller.dart';
import 'package:bai_serve/features/vendor/features/vendor_details/controllers/vendor_details_controller.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_model/vendor_model.dart';
import 'product_gridview_widget.dart';

@RoutePage()
class VendorDetailsScreen extends StatelessWidget {
  const VendorDetailsScreen({required this.vendorModel, super.key});
  final VendorModel vendorModel;

  @override
  Widget build(BuildContext context) => _content();

  Scaffold _content() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductController>().fetchProductDetails();
    });
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: GetBuilder<VendorDetailsController>(
          builder:
              (vendorController) => Stack(
                children: [
                  _vendorDetails(vendorModel),
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
                        appRouter.push(ChatRoute());
                      },
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }

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
        if (model.status == VerificationStatus.unverified)
          CommonButton(
            titleText: AppString.verifyNow,
            buttonWidth: 100,
            buttonHeight: 30,
            buttonRadius: 8,
            buttonColor: AppColors.primaryColor2,
            titleSize: 12,
            onTap: () {
              appRouter.push(VendorVerifyFormRoute(vendorModel: model));
            },
          ),

        20.height,

        const Expanded(child: ProductGridviewWidget(enableProductScrolling: true)),
      ],
    );
  }
}
