import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/common/app_bar/common_app_bar.dart';
import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/other_widgets/dual_field_row_widget.dart';
import 'package:bai_serve_customer/component/pop_up/common_alert.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/return_product/bloc/return_product_bloc.dart';
import 'package:bai_serve_customer/features/return_product/model/return_product_form_model.dart';
import 'package:bai_serve_customer/features/return_product/widgets/return_product_builder_widget.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../model/return_product_model.dart';

@RoutePage()
class ReturnProcessingScreen extends StatelessWidget {
  const ReturnProcessingScreen({required this.returnProductModel, required this.returnProductFormModel, super.key});

  final ReturnProductModel returnProductModel;
  final ReturnProductFormModel returnProductFormModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: AppString.drawerReturnsProduct),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (returnProductFormModel.images.isNotEmpty)
                LayoutBuilder(
                  builder: (context, constraints) {
                    final double size = (constraints.maxWidth / 3) - 10;
                    return Wrap(
                      children: [
                        ...returnProductFormModel.images.map(
                          (image) => ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(File(image), width: size, height: size, fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              CommonText(text: AppString.productDetails, style: getTheme.textTheme.titleMedium, top: 10, bottom: 10),
              ReturnProductBuilderWidget(returnProduct: returnProductModel),
              15.height,
              Card(
                color: AppColors.cartBG,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(text: returnProductFormModel.reason ?? '', style: getTheme.textTheme.titleMedium),
                    10.height,
                    CommonText(text: returnProductFormModel.details),
                  ],
                ).paddingAll(10),
              ),
              CommonText(text: AppString.pickupAddress, style: getTheme.textTheme.titleMedium, top: 10, bottom: 10),
              _pickupInformation(),
              20.height,
              CommonButton(
                titleText: AppString.submitRequest,
                buttonWidth: 200,
                onTap: () {
                  CommonAlert(
                    title: AppString.productReturnSuccessMessage,
                    actionButtonTittle: AppString.done,
                    onTap: () {
                      appRouter.popUntilRouteWithName(ReturnProductRoute.name);
                    },
                  );
                },
              ).center,
            ],
          ),
        ),
      ),
    );
  }

  Widget _pickupInformation() {
    return BlocProvider(
      create: (_) => ReturnProductBloc()..add(PickupAddressFetched()),
      child: BlocBuilder<ReturnProductBloc, ReturnProductState>(
        builder: (context, state) {
          if (state is! PickupAddressFetchSuccess) return const SizedBox.shrink();
          return Skeletonizer(
            enabled: state.isLoading,
            enableSwitchAnimation: true,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 92,
                      height: 92,
                      child: CommonImage(imageSrc: AppImages.house, borderRadius: 5),
                    ),
                    10.width,
                    Expanded(
                      child: Column(
                        children: [
                          DualFieldRow(
                            enableSpacer: false,
                            left: const Icon(Icons.person_outline),
                            right: CommonText(text: state.pickupAddressModel?.name ?? ''),
                          ),
                          DualFieldRow(
                            enableSpacer: false,
                            left: const Icon(Icons.phone_outlined),
                            right: CommonText(text: state.pickupAddressModel?.phoneNumber ?? ''),
                          ),
                          DualFieldRow(
                            enableSpacer: false,
                            left: const Icon(Icons.place_outlined),
                            right: CommonText(
                              text: state.pickupAddressModel?.address ?? '',
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
