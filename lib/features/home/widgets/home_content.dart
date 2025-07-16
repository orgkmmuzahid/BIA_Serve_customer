import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/text/common_rich_text.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/features/home/controller/home_controller.dart';
import 'package:bai_serve/features/home/controller/home_order_conroller.dart';
import 'package:bai_serve/features/home/model/order_list_model.dart';
import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/utils.dart';
import 'package:lazy_scroll_view/lazy_scroll_view.dart';

class HomeContent extends StatelessWidget {
   HomeContent({super.key, required this.homeController})
   :  orderListWidth =  Utils.deviceSize.width - 32,
    orderlistImageWidth =  (Utils.deviceSize.width - 32) / 3.2;
  
  final HomeController homeController;
  //private constant fields.
  final double orderListWidth;
  final double orderlistImageWidth;
  

  @override
  Widget build(BuildContext context) => GetBuilder<HomeOrderConroller>(builder:  (controller) => _content(controller));
  

  LazyListView _content(HomeOrderConroller controller) {
    return LazyListView.builder(
  itemCount: controller.orderList.length + 1,
 itemBuilder: (BuildContext context, int index) {
  if(index < 1) {
    return _topItems();
  } else {
    return _orderListItem(controller.orderList[index - 1]);
  }
 },
  
);
  }

  Widget _orderListItem(OrderListModel model) => SizedBox(
    width:  orderListWidth,
    child: Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
           CommonImage(imageSrc: AppImages.appsIcon, size: orderlistImageWidth), 
            10.width,
           CommonRichText(richTextContent: [
            CommonSimpleRichTextContent(text: '#${model.orderNumber}\n', style: theme.textTheme.bodyLarge?.copyWith(color: theme.primaryColor)),
            CommonSimpleRichTextContent(text: 'Order Placed – ${Utils.formatDateTime(model.orderPlacedDate)}\n', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 12)),
            CommonSimpleRichTextContent(text: 'Parcel Picked Up – ${Utils.formatDateTime(model.percelPickedUp)}\n', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 12)),
            CommonSimpleRichTextContent(text: 'In Transit – ${Utils.formatDateTime(model.inTransition)}\n', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 12)),
            CommonRichTextSpan(textSpan: TextSpan(children: [
                          TextSpan(text: 'Delivered – ', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 14)),

            TextSpan(text: '${model.outForDelivery}\n', style: theme.textTheme.bodyMedium?.copyWith(color: Color(0xffFFA500), fontWeight: FontWeight.bold, fontSize: 14)),

            ]))
           ]),
        ],),
      ),
    ),
  );
  

  Widget _topItems(){
    return Column(
      children: [
      CommonTextField(
                      prefixIcon:  IconButton( icon: Icon(Icons.search), onPressed: homeController.onSearch),
                      hintText: AppString.trackingID,
                      controller: homeController.searchController,
                    ),
                     20.height,
                     CommonImage(imageSrc: AppImages.homeBanner, height: (MediaQuery.of(Get.context!).size.width - 32) / 2.38, width: MediaQuery.of(Get.context!).size.width - 32, fill: BoxFit.fill,),
                    20.height,

                    //midle content
                    SingleChildScrollView(
                      child: Row(children: [
                        Column(children: [
                          _homeImageButton(image: AppImages.homePlaceOrder, titte: AppString.homePlaceOrder, onTap: homeController.onPlaceOrder),
                          _homeImageButton(image: AppImages.homeBulkOrderAgents, titte: AppString.homeBulkOrderAgents, onTap: homeController.onBulkOrderAgents),
                        ]),
                        10.width,
                        Column(children: [
                          _homeImageButton(image: AppImages.homeVendorSourcing, titte: AppString.homeVendorSourcing, onTap: homeController.onVendorSourcing),
                          _homeImageButton(image: AppImages.homeVerifyVendor, titte: AppString.homeVerifyVendor, onTap: homeController.onVerifyVendor),
                        ]),
                        10.width,
                        Column(children: [
                          _homeImageButton(image: AppImages.homePurchaseDelivery, titte: AppString.homePurchaseDelivery, onTap: homeController.onPurchaseAndDelivery),
                          _homeImageButton(image: AppImages.homeDoorToDoorPickup, titte: AppString.homeDoorToDoorPickup, onTap: homeController.onDoorToDoorPickup),
                        ]),
                      ],)),

                      //
                      Row(children: [
                        CommonText(text: AppString.myOrder, style: theme.textTheme.bodyLarge),
                        Spacer(), 
                        TextButton(onPressed: (){
                          homeController.onNavMenuChange(1);
                        }, child: CommonText(text: "${AppString.seeAll} \u2192"))
                      ],)
    ]);
  }
  

  Widget _homeImageButton({required String image, required String titte, required Function() onTap}) {
    double size =(Utils.deviceSize.width - 52) / 3;
    return GestureDetector(onTap: onTap,
    child: SizedBox(width: size, height: size, 
    child: Card(
      elevation: 2,
      shadowColor: theme.inputDecorationTheme.disabledBorder?.borderSide.color,
      color: theme.scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        CommonImage(imageSrc: image), 
        Container(
          height: 40,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: CommonText(text: titte, maxLines: 2,style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)))
      ],),
    )),
    );
  }
}