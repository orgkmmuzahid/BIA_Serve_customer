import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/image/image_picker/common_image_picker.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_multiline_text_field.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:bai_serve/utils/helpers/other_helper.dart';
import 'package:flutter/material.dart';

final Key _formKey = GlobalKey<FormState>();

class VendorVerifyFormScreen extends StatelessWidget {
  const VendorVerifyFormScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(appBar: const CommonAppBar(title: AppString.verifyVendor),
   body: Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Form(
    key: _formKey,
     child: Column(children: [
      10.height,
      CommonText(text: AppString.vendorName, style: theme.textTheme.titleMedium, bottom: 5,),
      CommonTextField(hintText: AppString.vendorName, validator: OtherHelper.requiredFieldValidator, onSaved: (value) {
        
      },),
      CommonText(text: AppString.vendorId, style: theme.textTheme.titleMedium, bottom: 5, top: 5,),
      
      CommonTextField(hintText: AppString.vendorId, validator: OtherHelper.requiredFieldValidator, onSaved: (value) {
        
      },),
      CommonText(text: AppString.uplaodScreenshot, style: theme.textTheme.titleMedium, top: 5, bottom: 5),
     CommonImagePicker(isMulti: true,),

      // const CommonImagePicker(isMulti: true, title: "Upload Multiple Images"),

      CommonText(text: AppString.vendorLocation, style: theme.textTheme.titleMedium, top: 5, bottom: 5),

      CommonMultilineTextField(height: 100, hintText: AppString.vendorLocation,onSave: (value){}),
      20.height,

      CommonButton(titleText: AppString.payment, onTap: () {
        
      },)
      
     ]),
   )),
  );
  
}