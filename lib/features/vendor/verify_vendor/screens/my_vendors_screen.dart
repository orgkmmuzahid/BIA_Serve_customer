import 'package:auto_route/auto_route.dart';
import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/other_widgets/smart_list_loader.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
import 'package:bai_serve/features/vendor/vendor_details/model/vendor_model.dart';
import 'package:bai_serve/features/vendor/verify_vendor/controllers/verify_vendor_controller.dart';
import 'package:bai_serve/features/vendor/verify_vendor/model/my_vendor_model.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


@RoutePage()
class MyVendorScreen extends StatelessWidget {
  const MyVendorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<VerifyVendorController>().fetchMyVendors();
    });
    return Scaffold(
      appBar: AppBar(title: const Text(AppString.myVendors), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GetBuilder<VerifyVendorController>(
          builder: (verifyVendorController) {
            return SmartListLoader(
              isLoading: verifyVendorController.myVendors.isRequesting,
              onRefresh: () => verifyVendorController.fetchMyVendors(refresh: true),
              onLoadMore: verifyVendorController.fetchMyVendors,
              itemCount: verifyVendorController.myVendors.data.length,
              itemBuilder: (_, index) => _itemBuilder(verifyVendorController.myVendors.data[index]),
              scrollController: verifyVendorController.scrollController,
            );
          },
        ),
      ),
    );
  }

  Widget _itemBuilder(MyVendorModel data) {
    final bool isPending = data.verifyStatus == VerifyStatus.pending;
    return GestureDetector(
      onTap: (){
         if(isPending){
           appRouter.push(const VerificationStatusRoute());
         }else{
          appRouter.push(VendorDetailsRoute(vendorModel: VendorModel(id: data.id,
           name: data.name,
            image: data.image,
             phoneNumber: data.phoneNumber,
              verificationStatus: data.verifyStatus == VerifyStatus.pending? VerificationStatus.unverified : VerificationStatus.verified)));
         }
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CommonImage(imageSrc: data.image, size: 70, borderRadius: 70, fill: BoxFit.fill,),
              10.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                CommonText(text: data.name, style: getTheme.textTheme.titleMedium),
                CommonText(text: '${AppString.vendorId}: ${data.id}', style: getTheme.textTheme.bodyMedium),
                CommonText(text: '${AppString.phoneNumber}: ${data.phoneNumber}', style: getTheme.textTheme.bodyMedium),
                CommonText(text: '${AppString.address}: ${data.address}', style: getTheme.textTheme.bodyMedium),
                CommonText(text: '${AppString.VerifyApplyDate}: ${data.applyDate.date}', style: getTheme.textTheme.bodyMedium),            
              ]),
              10.width,
              CommonText(
                text: data.verifyStatus.displayName,
                backgroundColor: isPending? AppColors.primaryColor2: AppColors.success,
                top: 5, bottom: 5, right: 10, left: 10,
                color: isPending ? AppColors.primaryText : AppColors.textWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
