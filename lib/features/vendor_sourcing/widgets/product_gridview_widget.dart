import 'dart:math';
import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/other_widgets/common_drop_down.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/vendor_sourcing/controllers/product_controller.dart';
import 'package:bai_serve/features/vendor_sourcing/model/product_model.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' show Get, GetNavigation;
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
              height: 35,
              child: Row(
                children: [
                  CommonText(text: AppString.allProducts, style: theme.textTheme.bodyLarge),
                  50.width,
                  Expanded(
                    child: CommonDropDown<String>(
                      hint: '',
                      borderColor: AppColors.secondaryText,
                      initailItem: productController.categories.data?.isNotEmpty == true ? productController.categories.data!.first : null,
                      items: productController.categories.data ?? [],
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
          enableProductScrolling ? Expanded(child: _products(productController)) : _products(productController),
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
      itemCount: limit == 0 ? productController.products.data?.length ?? 0 : min(productController.products.data?.length ?? 0, limit),
      itemBuilder: (context, index) => _productBuilder(productController.products.data![index]),
      staggeredTileBuilder: (index) => const StaggeredTile.count(1, 1),
    );
  }

  SizedBox _horizontalFilter(ProductController productController) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: productController.categories.data?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final item = productController.categories.data![index];
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
      Get.toNamed(AppRoutes.viewProduct);
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
                CommonText(text: product.name, textAlign: TextAlign.start, style: theme.textTheme.titleSmall, left: 5, right: 5),
                CommonText(
                  text: '${AppString.monySign} ${product.price}',
                  style: theme.textTheme.titleSmall?.copyWith(color: AppColors.primaryColor3),
                  left: 5,
                ),
                5.height,
              ],
            ),
          ),
    ),
  );
}
