import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/other_widgets/common_drop_down.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/features/vendor_sourcing/controllers/vendor_sourcing_controller.dart';
import 'package:bai_serve/features/vendor_sourcing/widgets/vendor_widget.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staggered_grid_view/flutter_staggered_grid_view.dart';

class AllVendorsScreen extends StatelessWidget {
  const AllVendorsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CommonAppBar(title: AppString.allVendors),
    body: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: GetBuilder<VendorSourcingController>(
        builder: (vendorSourcingController) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CommonText(
                  text: AppString.productCategory,
                  style: theme.textTheme.bodyLarge,
                  bottom: 10,
                ),
                CommonDropDown<String>(
                  hint: AppString.productCategory,
                  items: vendorSourcingController.vendorCategories,
                  initailItem: vendorSourcingController.selectedVendorCategory,
                  onChanged:
                      (value) => vendorSourcingController
                          .onVendorCategoryChange(value ?? ''),
                  nameBuilder: (value) => value,
                ),
                10.height,
                CommonText(
                  text: AppString.allVendors,
                  style: theme.textTheme.bodyLarge,
                  bottom: 10,
                ),
                StaggeredGridView.extentBuilder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  maxCrossAxisExtent: 90,
                  itemCount: vendorSourcingController.vendors.length,
                  itemBuilder:
                      (context, index) => VendorWidget(
                        model: vendorSourcingController.vendors[index],
                      ),
                  staggeredTileBuilder:
                      (index) => const StaggeredTile.count(1, 1.3),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}
