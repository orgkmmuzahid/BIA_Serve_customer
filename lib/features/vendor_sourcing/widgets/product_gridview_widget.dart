import 'dart:math';
import 'package:bai_serve/component/image/common_image.dart';
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
  const ProductGridviewWidget({super.key, this.limit = 0, this.showFilter = true});

  final int limit;
  final bool showFilter;
  @override
  Widget build(BuildContext context) => GetBuilder<ProductController>(
    builder: (productController) {
      return Column(
        children: [
          if(showFilter)
          SizedBox(
            height: 30,
            child: ListView.builder(
              itemCount: productController.productFilterModel.productFilters.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index){
                final item = productController.productFilterModel.productFilters[index];
                final bool isSelected = item == productController.productFilterModel.selectedFilter;
                return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    productController.onProductFilterSelectionChange(index);
                  },
                  child: CommonText(
                    enableBorder: isSelected? false : true,
                    borderRadius: 8,
                    fontWeight: FontWeight.bold,
                    backgroundColor: isSelected? AppColors.primaryColor : AppColors.serfeceBG,
                    color: isSelected? AppColors.textWhite : AppColors.primaryText,
                    left: 10, right: 10,
                    text: item),
                ),
              );
              }),
          ),

          10.height,
          StaggeredGridView.extentBuilder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            maxCrossAxisExtent: 200,
            itemCount: limit == 0 ? productController.products.length : min(productController.products.length, limit),
            itemBuilder: (context, index) => _productBuilder(productController.products[index]),
            staggeredTileBuilder: (index) => const StaggeredTile.count(1, 1),
          ),
        ],
      );
    },
  );

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
                CommonText(
                  text: product.name,
                  textAlign: TextAlign.start,
                  style: theme.textTheme.titleSmall,
                  left: 5,
                  right: 5,
                ),
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
