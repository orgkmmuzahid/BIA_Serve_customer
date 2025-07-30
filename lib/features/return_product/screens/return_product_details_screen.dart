import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/common/app_bar/common_app_bar.dart';
import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/component/image/image_picker/common_multi_image_picker.dart';
import 'package:bai_serve_customer/component/other_widgets/common_selectable_button.dart';
import 'package:bai_serve_customer/component/other_widgets/radio_group_form_field.dart';
import 'package:bai_serve_customer/component/text_field/common_multiline_text_field.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/return_product/model/return_product_form_model.dart';
import 'package:bai_serve_customer/features/return_product/model/return_product_model.dart';
import 'package:bai_serve_customer/features/return_product/widgets/return_product_builder_widget.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:bai_serve_customer/utils/helpers/other_helper.dart';
import 'package:bai_serve_customer/utils/log/app_log.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ReturnProductDetailsScreen extends StatefulWidget {
  const ReturnProductDetailsScreen({required this.returnProductModel, super.key});

  final ReturnProductModel returnProductModel;

  @override
  State<ReturnProductDetailsScreen> createState() => _ReturnProductDetailsScreenState();
}

class _ReturnProductDetailsScreenState extends State<ReturnProductDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  ReturnProductFormModel _returnProductFormModel = ReturnProductFormModel(id: '', images: [], details: '');

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CommonAppBar(title: AppString.drawerReturnsProduct),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ReturnProductBuilderWidget(returnProduct: widget.returnProductModel),

              CommonSelectableButton(
                width: 145,
                titles: AppString.returnTypes,
                validator: OtherHelper.requiredFieldValidator,
                onSaved: (newValue) {
                  _returnProductFormModel = _returnProductFormModel.copyWith(type: newValue);
                },
              ),

              RadioGroupFormField(
                options: AppString.returnReason,
                validator: OtherHelper.requiredFieldValidator,
                labelBuilder: (value) => value,
                onSaved: (newValue) {
                  _returnProductFormModel = _returnProductFormModel.copyWith(reason: newValue);
                },
              ),

              CommonMultiImagePickerFormField(
                validator: (value) => value?.isNotEmpty == true ? null : AppString.thisFieldIsRequired,
                onSaved: (newValue) {
                  _returnProductFormModel = _returnProductFormModel.copyWith(images: newValue);
                },
              ),
              10.height,
              CommonMultilineTextField(
                hintText: AppString.addMoreDetails,
                validator: OtherHelper.requiredFieldValidator,
                height: 120,
                onSave: (newValue) {
                  _returnProductFormModel = _returnProductFormModel.copyWith(details: newValue);
                },
              ),
              20.height,
              CommonButton(
                buttonWidth: 200,
                titleText: AppString.continues,
                onTap: () {
                  AppLogger.debug('${_formKey.currentState?.validate()}');
                  if (_formKey.currentState?.validate() == true) {
                    _formKey.currentState?.save();
                    appRouter.push(
                      ReturnProcessingRoute(
                        returnProductModel: widget.returnProductModel,
                        returnProductFormModel: _returnProductFormModel,
                      ),
                    );
                  }
                },
              ),
              20.height,
            ],
          ),
        ),
      ),
    ),
  );
}
