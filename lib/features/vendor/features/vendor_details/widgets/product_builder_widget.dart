import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/model/product_model.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

class ProductBuilderWidget extends StatelessWidget {
  const ProductBuilderWidget({required this.product, super.key});

  final ProductModel product;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      appRouter.push(ViewProductRoute(productId: product.id));
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
