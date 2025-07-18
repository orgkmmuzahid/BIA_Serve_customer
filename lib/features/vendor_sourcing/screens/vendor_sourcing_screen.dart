// File: vendor_sourcing_screen.dart
import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/other_widgets/common_drop_down.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_multiline_text_field.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// static const String vendorSourcing = "/vendor_sourcing_screen.dart";
// GetPage(name: vendorSourcing, page: () => const VendorSourcingScreen()),

class VendorSourcingScreen extends StatelessWidget {
  const VendorSourcingScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(appBar: CommonAppBar(title: AppString.homeVendorSourcing), 
    body: SingleChildScrollView(
      child: Padding(padding: EdgeInsets.only(left: 16, right: 16), 
             child: Column(children: [
                CommonText(text: AppString.productCategory, style: theme.textTheme.bodyLarge, bottom: 10),
                CommonDropDown<String>(hint: AppString.productCategory, items: [], onChanged: (value){}, nameBuilder: (value)=> value),

                CommonText(text: AppString.numberOfVendor, style: theme.textTheme.bodyLarge, bottom: 10, top: 10,),

                CommonText(text: AppString.budget, style: theme.textTheme.bodyLarge, bottom: 10, top: 10,),
                CommonTextField(hintText: AppString.budget, prefixText: AppString.monySign),
                
                CommonText(text: AppString.specialInstruction, style: theme.textTheme.bodyLarge, bottom: 10, top: 10,),
                CommonMultilineTextField(height: 120, hintText: AppString.specialInstruction , onSave: (value){}),
                
                CommonText(text: AppString.serviceFee, style: theme.textTheme.bodyLarge, bottom: 10, top: 10),
                20.height,
                CommonButton(titleText: AppString.submitRequest, onTap: () {
                  Get.toNamed(AppRoutes.vendorSourcingCategory);
                },)
             ]),
      ),
    ),
  );

}