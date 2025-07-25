import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/image/common_rotating_image_banner.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
import 'package:bai_serve/features/home/controller/home_controller.dart';
import 'package:bai_serve/features/vendor/vendor_details/widgets/product_gridview_widget.dart';
import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({required this.homeController, super.key});

  final HomeController homeController;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(children: [_topItems(), 20.height, const ProductGridviewWidget(isDropdownFilter: true)]),
  );

  Widget _topItems() {
    return Column(
      children: [
        CommonTextField(
          prefixIcon: IconButton(icon: const Icon(Icons.search), onPressed: homeController.onSearch),
          hintText: AppString.searchProduct,
          controller: homeController.searchController,
        ),
        20.height,
        CommonRotatingImageBanner(
          imageUrls: homeController.bannerUrls.data,
          currentIndex: homeController.currentIndex,
        ),
        20.height,

        //midle content
        SingleChildScrollView(
          child: Row(
            spacing: 2,
            children: [
              Column(
                children: [
                  _homeImageButton(
                    image: AppImages.homePlaceOrder,
                    titte: AppString.homePlaceOrder,
                    onTap: () => appRouter.push(PlaceOrderRoute(title: AppString.placeOrder)),
                  ),
                  _homeImageButton(
                    image: AppImages.homeBulkOrderAgents,
                    titte: AppString.homeBulkOrderAgents,
                    onTap:  ()=> appRouter.push(const BulkOrderRoute()),
                  ),
                ],
              ),
              Column(
                children: [
                  _homeImageButton(
                    image: AppImages.homeVendorSourcing,
                    titte: AppString.homeVendorSourcing,
                    onTap:  ()=> appRouter.push(const VendorSourcingRoute()),
                  ),
                  _homeImageButton(
                    image: AppImages.homeVerifyVendor,
                    titte: AppString.homeVerifyVendor,
                    onTap:  ()=> appRouter.push(const VerifyVendorRoute()),
                  ),
                ],
              ),
              Column(
                children: [
                  _homeImageButton(
                    image: AppImages.homePurchaseDelivery,
                    titte: AppString.homePurchaseDelivery,
                    onTap:  ()=> appRouter.push(const PurchaseDeliveryRoute()),
                  ),
                  _homeImageButton(
                    image: AppImages.homeDoorToDoorPickup,
                    titte: AppString.homeDoorToDoorPickup,
                    onTap:  ()=> appRouter.push(const DoorToDoorPickupRoute()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _homeImageButton({required String image, required String titte, required Function() onTap}) {
    final double size = (Utils.deviceSize.width - 40) / 3;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size + 10,
        child: Card(
          elevation: 2,
          shadowColor: getTheme.inputDecorationTheme.disabledBorder?.borderSide.color,
          color: getTheme.scaffoldBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CommonImage(imageSrc: image),
              Container(
                height: 40,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: CommonText(
                  alignment: MainAxisAlignment.center,
                  text: titte,
                  maxLines: 2,
                  style: getTheme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
