import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/features/home/controller/home_controller.dart';
import 'package:bai_serve/features/vendor_sourcing/widgets/product_gridview_widget.dart';
import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({required this.homeController, super.key});

  final HomeController homeController;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(child: Column(children: [
    _topItems(),
    20.height,
    const ProductGridviewWidget(),
  ]));

  Widget _topItems() {
    return Column(
      children: [
        CommonTextField(
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: homeController.onSearch,
          ),
          hintText: AppString.trackingID,
          controller: homeController.searchController,
        ),
        20.height,
        CommonImage(
          imageSrc: AppImages.homeBanner,
          height: (MediaQuery.of(Get.context!).size.width - 32) / 2.38,
          width: MediaQuery.of(Get.context!).size.width - 32,
          fill: BoxFit.fill,
        ),
        20.height,

        //midle content
        SingleChildScrollView(
          child: Row(
            children: [
              Column(
                children: [
                  _homeImageButton(
                    image: AppImages.homePlaceOrder,
                    titte: AppString.homePlaceOrder,
                    onTap: homeController.onPlaceOrder,
                  ),
                  _homeImageButton(
                    image: AppImages.homeBulkOrderAgents,
                    titte: AppString.homeBulkOrderAgents,
                    onTap: homeController.onBulkOrderAgents,
                  ),
                ],
              ),
              10.width,
              Column(
                children: [
                  _homeImageButton(
                    image: AppImages.homeVendorSourcing,
                    titte: AppString.homeVendorSourcing,
                    onTap: homeController.onVendorSourcing,
                  ),
                  _homeImageButton(
                    image: AppImages.homeVerifyVendor,
                    titte: AppString.homeVerifyVendor,
                    onTap: homeController.onVerifyVendor,
                  ),
                ],
              ),
              10.width,
              Column(
                children: [
                  _homeImageButton(
                    image: AppImages.homePurchaseDelivery,
                    titte: AppString.homePurchaseDelivery,
                    onTap: homeController.onPurchaseAndDelivery,
                  ),
                  _homeImageButton(
                    image: AppImages.homeDoorToDoorPickup,
                    titte: AppString.homeDoorToDoorPickup,
                    onTap: homeController.onDoorToDoorPickup,
                  ),
                ],
              ),
            ],
          ),
        ),

        //
        // Row(
        //   children: [
        //     CommonText(
        //       text: AppString.myOrder,
        //       style: theme.textTheme.bodyLarge,
        //     ),
        //     const Spacer(),
        //     TextButton(
        //       onPressed: () {
        //         homeController.onNavMenuChange(1);
        //       },
        //       child: const CommonText(text: '${AppString.seeAll} \u2192'),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  Widget _homeImageButton({
    required String image,
    required String titte,
    required Function() onTap,
  }) {
    final double size = (Utils.deviceSize.width - 52) / 3;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: Card(
          elevation: 2,
          shadowColor:
              theme.inputDecorationTheme.disabledBorder?.borderSide.color,
          color: theme.scaffoldBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CommonImage(imageSrc: image),
              Container(
                height: 40,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: CommonText(
                  text: titte,
                  maxLines: 2,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
