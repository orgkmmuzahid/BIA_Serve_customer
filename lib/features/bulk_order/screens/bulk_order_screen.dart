import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
import 'package:bai_serve/features/bulk_order/controllers/bulk_order_controller.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:bai_serve/utils/helpers/other_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

final _formKey = GlobalKey<FormState>();

@RoutePage()
class BulkOrderScreen extends StatelessWidget {
  const BulkOrderScreen({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<BulkOrderController>(
    builder: (bulkOrderController) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(AppString.homeBulkOrderAgents),
          leading: GestureDetector(
            onTap: bulkOrderController.onBackPress,
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                CommonText(
                  text: AppString.listOfSupplier,
                  style: getTheme.textTheme.bodyLarge,
                ).start,

                ...List.generate(
                  bulkOrderController.productItemDetails.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CommonTextField(
                        hintText: AppString.itemDetails,
                        borderColor: getTheme.dividerColor,
                        validator: OtherHelper.requiredFieldValidator,
                        onSaved: (value) {
                          final item = bulkOrderController
                              .productItemDetails
                              .entries
                              .elementAt(index);
                          bulkOrderController.onItemDetailsChange(
                            item.key,
                            value,
                          );
                        },
                      ),
                    );
                  },
                ),

                CommonButton(
                  titleText: AppString.addProduct,
                  buttonWidth: 200,
                  onTap: () {
                    bulkOrderController.increaseItemField();
                  },
                ),
                20.height,
                //image picker
                GestureDetector(
                  onTap: () {
                    bulkOrderController.pickImage();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: getTheme.colorScheme.surfaceContainerLowest,
                    ),
                    height: 150,
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          CommonText(
                            text: AppString.addImage,
                            alignment: MainAxisAlignment.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                20.height,

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      bulkOrderController.selectedImagesPath.length,
                      (index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.only(left: 12),
                          child: Image.file(
                            width: 80,
                            height: 80,
                            File(
                              bulkOrderController.selectedImagesPath.elementAt(
                                index,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                20.height,

                CommonButton(
                  titleText: AppString.continues,
                  onTap: () {
                    _formKey.currentState?.save();
                    appRouter.push(PlaceOrderRoute(title:  AppString.homeBulkOrderAgents));
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
