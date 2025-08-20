import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/common/app_bar/common_app_bar.dart';
import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/component/image/image_picker/common_multi_image_picker.dart';
import 'package:bai_serve_customer/component/other_widgets/dual_field_row_widget.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/component/text_field/common_multiline_text_field.dart';
import 'package:bai_serve_customer/component/text_field/common_text_field.dart';
import 'package:bai_serve_customer/component/text_field/input_helper.dart';
import 'package:bai_serve_customer/features/vendor/common_model/vendor_model.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:bai_serve_customer/utils/helpers/other_helper.dart';
import 'package:flutter/material.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@RoutePage()
class VendorVerifyFormScreen extends StatelessWidget {
  const VendorVerifyFormScreen({super.key, this.vendorModel});
  final VendorModel? vendorModel;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CommonAppBar(title: AppString.verifyVendor),
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
                validationType: ValidationType.validateFullName,
                onSaved: (value, controller) {},
              ),

              CommonText(text: AppString.vendorId, style: getTheme.textTheme.titleMedium, bottom: 5, top: 5),
              CommonTextField(
                initialText: vendorModel?.id,
                hintText: AppString.vendorId,
                validationType: ValidationType.validateRequired,
                onSaved: (value, controller) {},
              ),

              CommonText(text: AppString.phoneNumber, style: getTheme.textTheme.titleMedium, bottom: 5, top: 5),
              CommonTextField(
                validationType: ValidationType.validatePhone,
                initialText: vendorModel?.phoneNumber,
                hintText: AppString.phoneNumber,
                onSaved: (value, controller) {},
              ),

              // const CommonImagePicker(isMulti: true, title: "Upload Multiple Images"),
              CommonText(text: AppString.vendorLocation, style: getTheme.textTheme.titleMedium, top: 5, bottom: 5),

              CommonMultilineTextField(
                validationType: ValidationType.validateRequired,
                height: 100,
                hintText: AppString.vendorLocation,
                onSave: (value) {},
              ),

              CommonText(text: AppString.uplaodScreenshot, style: getTheme.textTheme.titleMedium, top: 5, bottom: 5),
              CommonMultiImagePickerFormField(isMulti: false, onSaved: (newValue) {}),

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
