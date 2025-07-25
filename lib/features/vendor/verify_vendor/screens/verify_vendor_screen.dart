// File: verify_vendor_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/common/vendor_avater_widget.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/other_widgets/common_drop_down.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
import 'package:bai_serve/features/vendor/verify_vendor/controllers/verify_vendor_controller.dart';
import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staggered_grid_view/flutter_staggered_grid_view.dart';

import '../repository/verify_vendor_repository.dart';


@RoutePage()
class VerifyVendorScreen extends StatelessWidget {
  const VerifyVendorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<VerifyVendorController>().fetchVendors(VendorFetchType.allVendor);
    });
    return Scaffold(
      appBar: const CommonAppBar(title: AppString.allVendors),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: GetBuilder<VerifyVendorController>(
          builder: (verifyVendorController) {
            return Stack(
              children: [
                Positioned.fill(child: _content(verifyVendorController)),
                Positioned(
                  bottom: 20,
                  right: 5,
                  child: CommonButton(
                    titleText: AppString.verifyVendor,
                    buttonWidth: 150,
                    onTap: () {
                      appRouter.push(VendorVerifyFormRoute());
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Column _content(VerifyVendorController verifyVendorController) {
    return Column(
      children: [
        CommonText(text: AppString.productCategory, style: getTheme.textTheme.bodyLarge, bottom: 10),
        CommonDropDown<String>(
          hint: AppString.productCategory,
          items: verifyVendorController.vendorCategories,
          initailItem: verifyVendorController.selectedVendorCategory,
          onChanged: (value) => verifyVendorController.onVendorCategoryChange(value ?? ''),
          nameBuilder: (value) => value,
        ),
        10.height,
        _filters(verifyVendorController),
        10.height,
        Expanded(
          child: StaggeredGridView.extentBuilder(
            physics: const BouncingScrollPhysics(),
            maxCrossAxisExtent: 90,
            itemCount: verifyVendorController.vendors.data.length,
            itemBuilder: (context, index) => VendorAvaterWidget(model: verifyVendorController.vendors.data[index]),
            staggeredTileBuilder: (index) => const StaggeredTile.count(1, 1.4),
          ),
        ),
      ],
    );
  }

  Widget _filters(VerifyVendorController controller) {
    final double buttonWidth = ((Utils.deviceSize.width - 32) / VendorFetchType.values.length) - 5;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            VendorFetchType.values
                .map(
                  (value) => Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: GestureDetector(
                      onTap: () {
                        controller.fetchVendors(value);
                      },
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: buttonWidth),
                        child: CommonText(
                          text: value.displayName,
                          borderColor: AppColors.serfeceBG,
                          top: 10,
                          bottom: 10,
                          left: 10,
                          right: 10,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          alignment: MainAxisAlignment.center,
                          backgroundColor: controller.vendorFetchType == value ? AppColors.lightRead : AppColors.cartBG,
                          color: AppColors.primaryText,
                          // buttonWidth: buttonWidth,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
