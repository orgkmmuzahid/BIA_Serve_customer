import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/other_widgets/smart_list_loader.dart';
import 'package:bai_serve/features/vendor/verify_vendor/controllers/verify_vendor_controller.dart';
import 'package:bai_serve/features/vendor/verify_vendor/model/my_vendor_model.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyVendorScreen extends StatelessWidget {
  const MyVendorScreen({super.key});

  @override
  Widget build(BuildContext context) { 
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<VerifyVendorController>().fetchMyVendors();
    });
   return Scaffold(
    appBar: AppBar(title: const Text(AppString.myVendors), 
    centerTitle: true),
    body: Padding(padding: const EdgeInsets.symmetric(horizontal: 16), 
     child: GetBuilder<VerifyVendorController>(
       builder: (verifyVendorController) {
         return SmartListLoader(
          isLoading: verifyVendorController.myVendors.isRequesting,
          onRefresh: ()=> verifyVendorController.fetchMyVendors(refresh: true) ,
          onLoadMore: verifyVendorController.fetchMyVendors,
          itemCount: verifyVendorController.myVendors.data.length,
          itemBuilder: (_,index)=> _itemBuilder(verifyVendorController.myVendors.data[index]), scrollController: verifyVendorController.scrollController);
       }
     ),
    ) ,
  );
  }

  Card _itemBuilder(MyVendorModel data) => Card(
    child: Row(children: [
      CommonImage(imageSrc: data.image, size: 70, borderRadius: 70),
      10.width,
      Column(children: [])
    ],),
  );
  
}