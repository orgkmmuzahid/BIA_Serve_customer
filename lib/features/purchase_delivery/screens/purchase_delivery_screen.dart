// File: purchase_delivery_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/image/image_picker/common_multi_image_picker.dart';
import 'package:bai_serve/component/other_widgets/common_drop_down.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_multiline_text_field.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
import 'package:bai_serve/features/purchase_delivery/controllers/purchase_delivery_controller.dart';
import 'package:bai_serve/features/purchase_delivery/model/purchase_delivery_model.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:bai_serve/utils/helpers/other_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@RoutePage()
class PurchaseDeliveryScreen extends StatelessWidget {
  const PurchaseDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text(AppString.homePurchaseDelivery)),
    body: Padding(
      padding: const EdgeInsetsGeometry.only(left: 16, right: 16),
      child: GetBuilder<PurchaseDeliveryController>(
        builder: (purchaseDeliveryController) {
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CommonText(text: AppString.vendorName, style: getTheme.textTheme.bodyLarge).start,
                  10.height,
                  CommonTextField(
                    hintText: AppString.vendorName,
                    validator: OtherHelper.requiredFieldValidator,
                    onSaved: (value) {
                      purchaseDeliveryController.onFormChange(
                        purchaseDeliveryController.purchaseDeliveryModel.copyWith(name: value),
                      );
                    },
                  ),
                  10.height,
                  CommonTextField(
                    hintText: AppString.vendorId,
                    validator: OtherHelper.requiredFieldValidator,
                    onSaved: (value) {
                      purchaseDeliveryController.onFormChange(
                        purchaseDeliveryController.purchaseDeliveryModel.copyWith(vendorId: value),
                      );
                    },
                  ),
                  10.height,

                  CommonTextField(
                    hintText: AppString.phoneNumber,
                    validator: OtherHelper.phoneValidator,
                    onSaved: (value) {
                      purchaseDeliveryController.onFormChange(
                        purchaseDeliveryController.purchaseDeliveryModel.copyWith(phoneNumber: value),
                      );
                    },
                  ),
                  10.height,
                  CommonMultiImagePickerFormField(onSaved: (newValue) {}),

                  CommonText(text: AppString.productAmount, style: getTheme.textTheme.bodyLarge).start,
                  10.height,
                  CommonTextField(
                    hintText: AppString.productAmount,
                    prefixText: AppString.monySign,
                    validator: OtherHelper.validateAmount,
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      purchaseDeliveryController.onFormChange(
                        purchaseDeliveryController.purchaseDeliveryModel.copyWith(amount: double.tryParse(value)),
                      );
                    },
                  ),
                  10.height,

                  CommonText(text: AppString.deliveryType, style: getTheme.textTheme.bodyLarge).start,
                  10.height,
                  CommonDropDown<DeliveryType>(
                    hint: AppString.deliveryType,
                    items: DeliveryType.values,
                    onChanged: (value) {
                      purchaseDeliveryController.onFormChange(
                        purchaseDeliveryController.purchaseDeliveryModel.copyWith(deliveryType: value),
                      );
                    },
                    nameBuilder: (DeliveryType value) => value.displayName,
                  ),

                  10.height,
                  CommonText(text: AppString.deliveryAddress, style: getTheme.textTheme.bodyLarge).start,
                  10.height,
                  CommonMultilineTextField(
                    hintText: AppString.deliveryAddress,
                    height: 80,
                    onSave: (value) {
                      purchaseDeliveryController.onFormChange(
                        purchaseDeliveryController.purchaseDeliveryModel.copyWith(deliveryAddress: value),
                      );
                    },
                  ),
                  10.height,
                  CommonText(text: AppString.productDescription, style: getTheme.textTheme.bodyLarge).start,
                  10.height,
                  CommonMultilineTextField(
                    hintText: AppString.productDescription,
                    height: 80,
                    onSave: (value) {
                      purchaseDeliveryController.onFormChange(
                        purchaseDeliveryController.purchaseDeliveryModel.copyWith(productDescription: value),
                      );
                    },
                  ),
                  10.height,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(text: AppString.serviceFee, style: getTheme.textTheme.bodyLarge, bottom: 10),
                          CommonText(text: AppString.totalAmount, style: getTheme.textTheme.bodyLarge, top: 15),
                        ],
                      ),
                      10.width,
                      Column(
                        children: [
                          SizedBox(
                            width: 182,
                            child: CommonText(
                              enableBorder: true,
                              top: 10,
                              bottom: 10,
                              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                              left: 10,
                              alignment: MainAxisAlignment.center,
                              text:
                                  '${AppString.monySign} ${purchaseDeliveryController.purchaseDeliveryModel.serviceFee}',
                            ),
                          ),
                          10.height,
                          SizedBox(
                            width: 182,
                            child: CommonText(
                              backgroundColor: AppColors.primaryColor2,
                              style: const TextStyle(
                                color: AppColors.textWhite,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                              enableBorder: true,
                              top: 10,
                              bottom: 10,
                              left: 10,
                              alignment: MainAxisAlignment.center,
                              text:
                                  '${AppString.monySign} ${purchaseDeliveryController.purchaseDeliveryModel.totalPay}',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  10.height,
                  CommonButton(
                    titleText: AppString.continues,
                    onTap: () {
                      appRouter.push(const PaymentRoute());
                    },
                  ),

                  20.height,
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
