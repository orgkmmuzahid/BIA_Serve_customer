import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/features/vendor/vendor_details/model/product_model.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductBuilderWidget extends StatelessWidget {
  const ProductBuilderWidget({required this.product, super.key});

  final ProductModel product;

  @override
  Widget build(BuildContext context) => GestureDetector(
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
                  style: getTheme.textTheme.titleSmall,
                  left: 5,
                  right: 5,
                ),
                CommonText(
                  text: '${AppString.monySign} ${product.price}',
                  style: getTheme.textTheme.titleSmall?.copyWith(
                    color: AppColors.primaryColor3,
                  ),
                  left: 5,
                ),
                5.height,
              ],
            ),
          ),
    ),
  );
}
