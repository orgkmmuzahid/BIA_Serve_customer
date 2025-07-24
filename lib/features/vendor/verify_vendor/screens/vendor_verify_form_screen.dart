import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/image/image_picker/common_multi_image_picker.dart';
import 'package:bai_serve/component/other_widgets/dual_field_row_widget.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_multiline_text_field.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/features/vendor/vendor_details/model/vendor_model.dart';
import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:bai_serve/utils/helpers/other_helper.dart';
import 'package:flutter/material.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

///arguments  VendorModel? vendorModel;
class VendorVerifyFormScreen extends StatelessWidget {
  VendorVerifyFormScreen({super.key}) : vendorModel = getArgument(name: 'vendorModel');

  final VendorModel? vendorModel;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CommonAppBar(title: AppString.verifyVendor),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              10.height,
              CommonText(text: AppString.vendorName, style: getTheme.textTheme.titleMedium, bottom: 5),
              CommonTextField(
                initialText: vendorModel?.name,
                hintText: AppString.vendorName,
                validator: OtherHelper.requiredFieldValidator,
                onSaved: (value) {},
              ),

              CommonText(text: AppString.vendorId, style: getTheme.textTheme.titleMedium, bottom: 5, top: 5),
              CommonTextField(
                initialText: vendorModel?.id,
                hintText: AppString.vendorId,
                validator: OtherHelper.requiredFieldValidator,
                onSaved: (value) {},
              ),

              CommonText(text: AppString.phoneNumber, style: getTheme.textTheme.titleMedium, bottom: 5, top: 5),
              CommonTextField(
                initialText: vendorModel?.phoneNumber,
                hintText: AppString.phoneNumber,
                validator: OtherHelper.requiredFieldValidator,
                onSaved: (value) {},
              ),

              // const CommonImagePicker(isMulti: true, title: "Upload Multiple Images"),
              CommonText(text: AppString.vendorLocation, style: getTheme.textTheme.titleMedium, top: 5, bottom: 5),

              CommonMultilineTextField(height: 100, hintText: AppString.vendorLocation, onSave: (value) {}),

              CommonText(text: AppString.uplaodScreenshot, style: getTheme.textTheme.titleMedium, top: 5, bottom: 5),
              CommonMultiImagePicker(isMulti: false),

              10.height,
              DualFieldRow(
                enableSpacer: false,
                left: CommonText(text: '${AppString.serviceFee} :', style: getTheme.textTheme.titleMedium),
                right: Padding(
                  padding: const EdgeInsets.only(right: 80),
                  child: CommonText(
                    text: '${AppString.monySign} 500',
                    style: getTheme.textTheme.bodyMedium,
                    enableBorder: true,
                    top: 10,
                    bottom: 10,
                    right: 10,
                    left: 10,
                  ),
                ),
              ),
              20.height,

              CommonButton(
                titleText: AppString.payment,
                onTap: () {
                  _formKey.currentState?.save();
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
