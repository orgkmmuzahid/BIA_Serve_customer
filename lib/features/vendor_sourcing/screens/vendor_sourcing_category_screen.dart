import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/other_widgets/common_drop_down.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/vendor_sourcing/controllers/vendor_sourcing_controller.dart';
import 'package:bai_serve/features/vendor_sourcing/widgets/product_builder_widget.dart';
import 'package:bai_serve/features/vendor_sourcing/widgets/vendor_widget.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staggered_grid_view/flutter_staggered_grid_view.dart';

class VendorSourcingCategoryScreen extends StatelessWidget {
  const VendorSourcingCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CommonAppBar(title: AppString.vendorSourcingCategory),
    body: Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
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
                _showMoreBuilder(
                  vendorSourcingController: vendorSourcingController,
                  route: AppRoutes.allVendors,
                  title: AppString.allVendors,
                ),

                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: vendorSourcingController.vendors.length> 6 ? 6 : vendorSourcingController.vendors.length,
                    itemBuilder:
                        (_, index) =>
                            SizedBox(
                              width: 70,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: VendorWidget(model: vendorSourcingController.vendors[index]),
                              )),
                  ),
                ),
                _showMoreBuilder(
                  vendorSourcingController: vendorSourcingController,
                  route: AppRoutes.allProducts,
                  title: vendorSourcingController.selectedVendorCategory,
                ),

                StaggeredGridView.extentBuilder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  maxCrossAxisExtent: 200,
                  itemCount: vendorSourcingController.products.length> 6? 6: vendorSourcingController.products.length,
                 itemBuilder: (context, index) => ProductBuilderWidget(product: vendorSourcingController.products[index]),
                  staggeredTileBuilder: (index) =>
        StaggeredTile.count(1,1))

                // GridView.builder(
                //   physics: NeverScrollableScrollPhysics(),
                //   shrinkWrap: true,
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2, // Number of columns
                //     crossAxisSpacing: 10,
                //     mainAxisSpacing: 10,
                //     childAspectRatio: 1, // Width / Height ratio
                //   ),
                //   itemCount: vendorSourcingController.products.length> 6? 6 : vendorSourcingController.products.length,
                //   itemBuilder:
                //       (context, index) => ProductBuilderWidget(product: vendorSourcingController.products[index]),
                // ),
                // 20.height,
              ],
            ),
          );
        },
      ),
    ),
  );

  Row _showMoreBuilder({
    required VendorSourcingController vendorSourcingController,
    required String route,
    required String title,
  }) => Row(
    children: [
      CommonText(
        text: title,
        style: theme.textTheme.bodyLarge,
        bottom: 10,
        top: 10,
      ),
      const Spacer(),
      TextButton(
        onPressed: () {
          Get.toNamed(route);
        },
        child: Text(AppString.seeAll),
      ),
    ],
  );
  
}
