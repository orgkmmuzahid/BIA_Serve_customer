// File: vendor_sourcing_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/other_widgets/common_drop_down.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_multiline_text_field.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
import 'package:bai_serve/features/vendor/features/vendor_details/controllers/product_controller.dart';
import 'package:bai_serve/features/vendor/features/vendor_sourcing/controllers/vendor_sourcing_controller.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@RoutePage()
class VendorSourcingScreen extends StatelessWidget {
  const VendorSourcingScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CommonAppBar(title: AppString.homeVendorSourcing),
    body: SingleChildScrollView(
      child: GetBuilder<VendorSourcingController>(
        builder: (vendorSourcingController) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                CommonText(text: AppString.productCategory, style: getTheme.textTheme.bodyLarge, bottom: 10),
                _productCategory(),

                CommonText(text: AppString.numberOfVendor, style: getTheme.textTheme.bodyLarge, bottom: 10, top: 10),

                _vendorsServiceList(vendorSourcingController),

                CommonText(text: AppString.budget, style: getTheme.textTheme.bodyLarge, bottom: 10, top: 10),
                const CommonTextField(hintText: AppString.budget, prefixText: AppString.monySign),

                CommonText(
                  text: AppString.specialInstruction,
                  style: getTheme.textTheme.bodyLarge,
                  bottom: 10,
                  top: 10,
                ),
                CommonMultilineTextField(height: 120, hintText: AppString.specialInstruction, onSave: (value) {}),
                10.height,
                Row(
                  children: [
                    CommonText(text: AppString.serviceFee, style: getTheme.textTheme.bodyLarge, bottom: 10, top: 10),
                    10.width,
                    CommonText(
                      text: '${AppString.monySign} ${vendorSourcingController.selectedServiceFee.value}',
                      style: getTheme.textTheme.titleMedium?.copyWith(color: AppColors.primaryColor),
                      enableBorder: true,
                      backgroundColor: AppColors.serfeceBG,
                      borderColor: AppColors.primaryColor,
                      top: 10,
                      bottom: 10,
                      left: 15,
                      right: 15,
                      borderRadius: 10,
                    ),
                  ],
                ),
                20.height,
                CommonButton(
                  titleText: AppString.submitRequest,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder:
                          (_) => AlertDialog(
                            backgroundColor: getTheme.scaffoldBackgroundColor,
                            content: Text(
                              AppString.vendorVerificationRequestMessage,
                              textAlign: TextAlign.center,
                              style: getTheme.textTheme.bodyLarge,
                            ),
                            actions: [
                              CommonButton(
                                titleText: AppString.done,
                                onTap: () {
                                  appRouter.popUntilRouteWithName(HomeRoute.name);
                                },
                              ),
                            ],
                          ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    ),
  );

  GetBuilder<ProductController> _productCategory() {
    return GetBuilder<ProductController>(
      builder: (productController) {
        return CommonDropDown<String>(
          hint: AppString.productCategory,
          initailItem: productController.selectedCategory,
          items: productController.categories.data,
          onChanged: (value) => productController.onCategorySelection(value ?? ''),
          nameBuilder: (value) => value,
        );
      },
    );
  }

  SizedBox _vendorsServiceList(VendorSourcingController vendorSourcingController) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: vendorSourcingController.serviceFee.length,
        itemBuilder: (_, index) {
          final item = vendorSourcingController.serviceFee.entries.elementAt(index);
          final bool isSelected = item.key == vendorSourcingController.selectedServiceFee.key;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CommonButton(
              buttonWidth: 100,
              borderWidth: 2,
              titleSize: 19,
              titleColor: isSelected ? AppColors.primaryColor : AppColors.primaryText,
              borderColor: isSelected ? AppColors.primaryColor : AppColors.stock2,
              onTap: () => vendorSourcingController.onServiceFeeSelection(item),
              buttonColor: isSelected ? AppColors.cartBG : AppColors.serfeceBG,
              titleText: item.key,
            ),
          );
        },
      ),
    );
  }
}
