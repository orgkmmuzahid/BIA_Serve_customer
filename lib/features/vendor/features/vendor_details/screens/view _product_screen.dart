import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/common/app_bar/common_app_bar.dart';
import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/other_widgets/screenshot_priview.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/controllers/product_controller.dart';
import 'package:bai_serve_customer/utils/app_utils.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:share_plus/share_plus.dart';

final GlobalKey _previewContainerKey = GlobalKey();

@RoutePage()
class ViewProductScreen extends StatelessWidget {
  const ViewProductScreen({super.key});

  @override
  Widget build(BuildContext context) => _content(context);

  RepaintBoundary _content(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductController>().fetchProductDetails();
    });

    return RepaintBoundary(
      key: _previewContainerKey,
      child: Scaffold(
        appBar: const CommonAppBar(title: AppString.viewProduct),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: GetBuilder<ProductController>(
            builder: (productController) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonImage(
                      imageSrc: productController.productDetailsModel.data?.image ?? '',
                      height: 227,
                      fill: BoxFit.fill,
                    ),

                    13.height,
                    _nameBuilder(productController),
                    CommonText(
                      text: productController.productDetailsModel.data?.description ?? '',
                      textAlign: TextAlign.justify,
                      fontSize: 13,
                    ),
                    20.height,
                    CommonText(
                      text: '${AppString.monySign} ${productController.productDetailsModel.data?.price}',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor3,
                    ),
                    20.height,
                    CommonText(text: AppString.productDetails, style: getTheme.textTheme.bodyLarge),
                    20.height,
                    _pickers(productController),
                    30.height,
                    _screenshot(context),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  SizedBox _pickers(ProductController productController) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              5.height,
              const CommonText(text: AppString.availableSize, fontSize: 14),
              const Spacer(),
              const CommonText(text: AppString.availableColor, fontSize: 14),
              const Spacer(),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_sizePicker(productController), 12.height, _colorPicker(productController)],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sizePicker(ProductController productController) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: productController.productDetailsModel.data?.availableSizes.length ?? 0,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          final bool isSelected = productController.selectedAvailableSizeIndex == index;
          return GestureDetector(
            onTap: () {
              productController.onAvailableSizeChange(index);
            },
            child: SizedBox(
              width: 40,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CommonText(
                  alignment: MainAxisAlignment.center,
                  borderColor: AppColors.serfeceBG,
                  color: isSelected ? AppColors.textWhite : AppColors.primaryText,
                  backgroundColor: isSelected ? AppColors.primaryColor : AppColors.cartBG,
                  text: Utils.formatDouble(productController.productDetailsModel.data?.availableSizes[index] ?? 0),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _colorPicker(ProductController productController) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: productController.productDetailsModel.data?.availableColors.length ?? 0,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          final bool isSelected = productController.selectedColorIndex == index;
          return GestureDetector(
            onTap: () {
              productController.onColorChange(index);
            },
            child: SizedBox(
              width: 40,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: productController.productDetailsModel.data?.availableColors[index],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: AppColors.primaryColor3, blurRadius: isSelected ? 10 : 0)],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  CommonButton _screenshot(BuildContext context) {
    return CommonButton(
      titleText: AppString.screenshot,
      buttonColor: AppColors.primaryColor3,
      onTap: () {
        Utils.takeScreenshot(_previewContainerKey).then((path) {
          if (path != null) {
            // ignore: use_build_context_synchronously
            final view = ScreenshotPreview(buildContext: context, imagePath: path, width: 100, height: 200);
            view.show();
          }
        });
      },
    );
  }

  Row _nameBuilder(ProductController productController) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CommonText(
            textAlign: TextAlign.start,
            alignment: MainAxisAlignment.start,
            text: productController.productDetailsModel.data?.name ?? '',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            bottom: 10,
          ),
        ),
        SizedBox(
          width: 30,
          child: GestureDetector(
            onTap: () {
              SharePlus.instance.share(
                ShareParams(title: productController.productDetailsModel.data?.name, text: 'url here'),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.serfeceBG,
                border: BoxBorder.all(color: AppColors.primaryColor, width: 2),
                borderRadius: BorderRadius.circular(30),
              ),
              width: 30,
              height: 30,
              padding: const EdgeInsets.only(),
              child: const Icon(Icons.share, color: AppColors.primaryColor, size: 20),
            ),
          ),
        ),
      ],
    );
  }
}
