import 'dart:math';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/other_widgets/common_drop_down.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/controllers/product_controller.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/model/product_model.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductGridviewWidget extends StatelessWidget {
  const ProductGridviewWidget({
    super.key,
    this.limit = 0,
    this.showFilter = true,
    this.isDropdownFilter = false,
    this.enableProductScrolling = false,
  });

  final int limit;
  final bool showFilter;
  final bool isDropdownFilter;
  final bool enableProductScrolling;
  @override
  Widget build(BuildContext context) => GetBuilder<ProductController>(
    builder: (productController) {
      return Column(
        children: [
          if (showFilter && isDropdownFilter == false) _horizontalFilter(productController),
          if (showFilter && isDropdownFilter == true)
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  CommonText(text: AppString.allProducts, style: getTheme.textTheme.bodyLarge),
                  50.width,
                  Expanded(
                    child: CommonDropDown<String>(
                      hint: '',
                      borderColor: AppColors.secondaryText,
                      items: productController.categories.data,
                      onChanged: (value) {
                        productController.onCategorySelection(value!);
                      },
                      nameBuilder: (value) => value,
                    ),
                  ),
                ],
              ),
            ),

          10.height,
          GetBuilder<ProductController>(
            builder:
                (productController) =>
                    enableProductScrolling
                        ? Expanded(child: _products(productController))
                        : _products(productController),
          ),
        ],
      );
    },
  );

  StaggeredGridView _products(ProductController productController) {
    return StaggeredGridView.extentBuilder(
      shrinkWrap: !enableProductScrolling,
      padding: const EdgeInsets.only(top: 10),
      physics: enableProductScrolling ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
      maxCrossAxisExtent: 200,
      itemCount:
          limit == 0 ? productController.products.data.length : min(productController.products.data.length, limit),
      itemBuilder: (context, index) => _productBuilder(productController.products.data[index]),
      staggeredTileBuilder: (index) => const StaggeredTile.count(1, 1),
    );
  }

  SizedBox _horizontalFilter(ProductController productController) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: productController.categories.data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final item = productController.categories.data[index];
          final bool isSelected = item == productController.selectedCategory;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                productController.onCategorySelection(item);
              },
              child: CommonText(
                enableBorder: isSelected ? false : true,
                borderRadius: 8,
                fontWeight: FontWeight.bold,
                backgroundColor: isSelected ? AppColors.primaryColor : AppColors.serfeceBG,
                color: isSelected ? AppColors.textWhite : AppColors.primaryText,
                left: 10,
                right: 10,
                text: item,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _productBuilder(ProductModel product) => GestureDetector(
    onTap: () {
      appRouter.push(const ViewProductRoute());
    },
    child: LayoutBuilder(
      builder:
          (_, constrains) => Card(
            color: AppColors.cartBG,
            child: Column(
              children: [
                5.height,
                CommonImage(
                  imageSrc: product.image,
                  width: constrains.maxWidth * .9,
                  height: constrains.maxHeight * .55,
                  fill: BoxFit.fill,
                ),
                const Spacer(),
                CommonText(
                  text: product.name,
                  textAlign: TextAlign.start,
                  style: getTheme.textTheme.titleSmall,
                  left: 5,
                  right: 5,
                ),
                CommonText(
                  text: '${AppString.monySign} ${product.price}',
                  style: getTheme.textTheme.titleSmall?.copyWith(color: AppColors.primaryColor3),
                  left: 5,
                ),
                5.height,
              ],
            ),
          ),
    ),
  );
}
