import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/image/common_rotating_image_banner.dart';
import 'package:bai_serve_customer/component/search_bar/common_search_bar.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/component/text_field/common_text_field.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/home/controller/home_controller.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/widgets/product_gridview_widget.dart';
import 'package:bai_serve_customer/utils/app_utils.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({required this.homeController, super.key});

  final HomeController homeController;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      10.height,
      CommonSearchBar(hints: AppString.searchProduct, onSubmit: (term) {}),
      10.height,
      Expanded(child: ProductGridviewWidget(topWidget: _topItems(), showFilterAfterTopWidget: true)),
    ],
  );

  Widget _topItems() {
    return Column(
      children: [
        CommonRotatingImageBanner(imageUrls: homeController.bannerUrls.data, currentIndex: homeController.currentIndex),
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
                    onTap: () => appRouter.push(const BulkOrderRoute()),
                  ),
                ],
              ),
              Column(
                children: [
                  _homeImageButton(
                    image: AppImages.homeVendorSourcing,
                    titte: AppString.homeVendorSourcing,
                    onTap: () => appRouter.push(const VendorSourcingRoute()),
                  ),
                  _homeImageButton(
                    image: AppImages.homeVerifyVendor,
                    titte: AppString.homeVerifyVendor,
                    onTap: () => appRouter.push(const VerifyVendorRoute()),
                  ),
                ],
              ),
              Column(
                children: [
                  _homeImageButton(
                    image: AppImages.homePurchaseDelivery,
                    titte: AppString.homePurchaseDelivery,
                    onTap: () => appRouter.push(const PurchaseDeliveryRoute()),
                  ),
                  _homeImageButton(
                    image: AppImages.homeDoorToDoorPickup,
                    titte: AppString.homeDoorToDoorPickup,
                    onTap: () => appRouter.push(const DoorToDoorPickupRoute()),
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
        height: size + 20,
        child: Card(
          elevation: 2,

          // shadowColor: getTheme.inputDecorationTheme.disabledBorder?.borderSide.color,
          color: getTheme.scaffoldBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CommonImage(imageSrc: image),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
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
