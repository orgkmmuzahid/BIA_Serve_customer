import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/features/home/controller/home_controller.dart';
import 'package:bai_serve/features/home/model/order_list_model.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:lazy_scroll_view/lazy_scroll_view.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context)=> LazyListView.builder(
    itemCount: controller.orderList.length + 1,
   itemBuilder: (BuildContext context, int index) {
    if(index < 1) {
      return _topItems();
    } else {
      // return _orderListItem();
      return Container(child: Text("$index"),);
    }
   },
    
  );
  

  Widget _orderListItem(OrderListModel model) => Text("Order Item here");
  

  Widget _topItems(){
    return Column(
      children: [
      CommonTextField(
                      prefixIcon:  IconButton( icon: Icon(Icons.search), onPressed: controller.onSearch),
                      hintText: AppString.trackingID,
                      controller: controller.searchController,
                    ),
                     20.height,
                     CommonImage(imageSrc: AppImages.homeBanner, height: (MediaQuery.of(Get.context!).size.width - 32) / 2.38, width: MediaQuery.of(Get.context!).size.width - 32, fill: BoxFit.fill,),
                    20.height,

                    //midle content
                    SingleChildScrollView(
                      child: Row(children: [
                        Column(children: [
                          _homeImageButton(image: AppImages.homePlaceOrder, titte: AppString.homePlaceOrder, onTap: (){}),
                          _homeImageButton(image: AppImages.homeBulkOrderAgents, titte: AppString.homeBulkOrderAgents, onTap: (){}),
                        ]),
                        10.width,
                        Column(children: [
                          _homeImageButton(image: AppImages.homeVendorSourcing, titte: AppString.homeVendorSourcing, onTap: (){}),
                          _homeImageButton(image: AppImages.homeVerifyVendor, titte: AppString.homeVerifyVendor, onTap: (){}),
                        ]),
                        10.width,
                        Column(children: [
                          _homeImageButton(image: AppImages.homePurchaseDelivery, titte: AppString.homePurchaseDelivery, onTap: (){}),
                          _homeImageButton(image: AppImages.homeDoorToDoorPickup, titte: AppString.homeDoorToDoorPickup, onTap: (){}),
                        ]),
                      ],)),

                      //
                      Row(children: [
                        CommonText(text: AppString.myOrder, style: theme.textTheme.bodyLarge),
                        Spacer(), 
                        TextButton(onPressed: (){}, child: CommonText(text: "${AppString.seeAll} \u2192"))
                      ],)
    ]);
  }
  

  Widget _homeImageButton({required String image, required String titte, required Function() onTap}) {
    double size =(MediaQuery.of(Get.context!).size.width - 52) / 3;
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