import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/common/app_bar/common_app_bar.dart';
import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/other_widgets/screenshot_priview.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/bloc/product_details_bloc.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/bloc/product_details_event.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/bloc/product_details_state.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/model/product_details_model.dart';
import 'package:bai_serve_customer/utils/app_utils.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:bai_serve_customer/utils/log/app_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

final GlobalKey _previewContainerKey = GlobalKey();

@RoutePage()
class ViewProductScreen extends StatelessWidget {
  const ViewProductScreen({required this.productId, super.key});
  final String productId;

  @override
  Widget build(BuildContext context) => _content(context);

  RepaintBoundary _content(BuildContext context) {
    return RepaintBoundary(
      key: _previewContainerKey,
      child: Scaffold(
        appBar: const CommonAppBar(title: AppString.viewProduct),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: BlocProvider<ProductDetailsBloc>(
            create: (context) => ProductDetailsBloc()..add(ProductDetailsFetched(productId: productId)),
            child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonImage(imageSrc: state.model?.image ?? '', height: 227, fill: BoxFit.fill),

                    13.height,
                    _nameBuilder(state.model),
                    CommonText(text: state.model?.description ?? '', textAlign: TextAlign.justify, fontSize: 13),
                    20.height,
                    CommonText(
                      text: '${AppString.monySign} ${state.model?.price}',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor3,
                    ),
                    20.height,
                    CommonText(text: AppString.productDetails, style: getTheme.textTheme.bodyLarge),
                    20.height,
                    _pickers(state.model?.availableSizes ?? [], state.model?.availableColors ?? []),
                    30.height,
                    _screenshot(context),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _pickers(List<double> sizes, List<Color> colors) {
    return SizedBox(
      height: 90.w,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              15.height,
              const CommonText(text: AppString.availableSize, fontSize: 14),
              const Spacer(),
              const CommonText(text: AppString.availableColor, fontSize: 14),
              const Spacer(),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_sizePicker(sizes), 12.height, _colorPicker(colors)],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sizePicker(List<double> sizes) {
    return BlocSelector<ProductDetailsBloc, ProductDetailsState, double?>(
      selector:
          (state) => switch (state) {
            ProductDetailsState(:final double? size) => size,
          },
      builder: (context, state) {
        AppLogger.debug(sizes.toString());
        return SizedBox(
          height: 40.w,
          child: ListView.builder(
            itemCount: sizes.length,
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              final bool isSelected = state == sizes[index];
              return GestureDetector(
                onTap: () {
                  context.read<ProductDetailsBloc>().add(ProductDetailsOnSizeSelectionChanged(size: sizes[index]));
                },
                child: IntrinsicWidth(
                  child: CommonText(
                    top: 4,
                    bottom: 8,
                    right: 8,
                    left: 8,
                    alignment: MainAxisAlignment.center,
                    borderColor: AppColors.serfeceBG,
                    color: isSelected ? AppColors.textWhite : AppColors.primaryText,
                    backgroundColor: isSelected ? AppColors.primaryColor : AppColors.cartBG,
                    text: Utils.formatDouble(sizes[index]),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _colorPicker(List<Color> colors) {
    return SizedBox(
      height: 30,
      child: BlocSelector<ProductDetailsBloc, ProductDetailsState, Color?>(
        selector:
            (state) => switch (state) {
              ProductDetailsState(:final Color? color) => color,
            },
        builder: (context, state) {
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: colors.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              final bool isSelected = colors[index] == state;
              return GestureDetector(
                onTap: () {
                  context.read<ProductDetailsBloc>().add(ProductDetailsOnColorSelectionChanged(color: colors[index]));
                },
                child: SizedBox(
                  width: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: colors[index],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: AppColors.primaryColor3, blurRadius: isSelected ? 10 : 0)],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  CommonButton _screenshot(BuildContext context) {
    return CommonButton(
      titleText: AppString.screenshot,
      buttonColor: AppColors.primaryColor3,
      onTap: () {
        Utils.takeScreenshot(_previewContainerKey).then((path) {
          if (path != null) {
            // ignore: use_build_context_synchronously
            final view = ScreenshotPreview(buildContext: context, imagePath: path, width: 100, height: 200);
            view.show();
          }
        });
      },
    );
  }

  Row _nameBuilder(ProductDetailsModel? model) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CommonText(
            textAlign: TextAlign.start,
            alignment: MainAxisAlignment.start,
            text: model?.name ?? '',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            bottom: 10,
          ),
        ),
        SizedBox(
          width: 30,
          child: GestureDetector(
            onTap: () {
              SharePlus.instance.share(ShareParams(title: model?.name, text: 'url here'));
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.serfeceBG,
                border: BoxBorder.all(color: AppColors.primaryColor, width: 2),
                borderRadius: BorderRadius.circular(30),
              ),
              width: 30,
              height: 30,
              padding: const EdgeInsets.only(),
              child: const Icon(Icons.share, color: AppColors.primaryColor, size: 20),
            ),
          ),
        ),
      ],
    );
  }
}
