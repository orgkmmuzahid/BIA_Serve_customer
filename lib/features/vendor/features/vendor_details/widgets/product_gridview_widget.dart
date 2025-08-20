import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/other_widgets/smart_staggered_loader.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/vendor/common_widget/category_selector/product_cateogry_widget.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/cubit/product_cubit.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/cubit/product_state.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/model/product_model.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductGridviewWidget extends StatelessWidget {
  const ProductGridviewWidget({
    super.key,
    this.limit = 0,
    this.enableProductScrolling = false,
    this.topWidget,
    this.showFilterAfterTopWidget = false,
    this.onRefresh,
  });

  final int limit;
  final bool enableProductScrolling;
  final Widget? topWidget;
  final bool showFilterAfterTopWidget;
  final Function? onRefresh;
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => ProductCubit()..fetch(),
    child: BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final cubit = context.read<ProductCubit>();
        return Column(
          children: [
            if (showFilterAfterTopWidget == false) _category(cubit),
            Expanded(
              child: SmartStaggeredLoader(
                itemCount: state.products?.length ?? 0,
                onRefresh: () {
                  cubit.fetch();
                  if (onRefresh != null) {
                    onRefresh!();
                  }
                },
                onLoadMore: cubit.loadMore,
                topWidget: _topWidget(cubit),
                staggeredTile: const StaggeredTile.count(1, 1),
                physics:
                    enableProductScrolling
                        ? const AlwaysScrollableScrollPhysics()
                        : const NeverScrollableScrollPhysics(),
                isLoading: state.products?.isEmpty == true && state.isLoading,
                isLoadingMore: state.products?.isNotEmpty == true && state.isLoading,
                itemBuilder: (context, index) {
                  return SizedBox(child: _productBuilder(state.products![index]));
                },
              ),
            ),
          ],
        );
      },
    ),
  );
  Widget _category(ProductCubit cubit) => Padding(
    padding: EdgeInsets.symmetric(vertical: 10.w),
    child: Row(
      children: [
        CommonText(text: AppString.allProducts, style: getTheme.textTheme.bodyLarge),
        50.width,
        Expanded(child: ProductCateogryWidget(onChange: (context, category) {})),
      ],
    ),
  );

  Widget? _topWidget(ProductCubit cubit) {
    if (topWidget == null) return showFilterAfterTopWidget ? _category(cubit) : null;
    return Column(children: [topWidget!, if (showFilterAfterTopWidget) _category(cubit)]);
  }

  Widget _productBuilder(ProductModel product) => GestureDetector(
    onTap: () {
      appRouter.push(ViewProductRoute(productId: product.id));
    },
    child: LayoutBuilder(
      builder:
          (_, constrains) => SizedBox(
            width: constrains.maxWidth,
            height: constrains.maxWidth,
            child: Card(
              color: AppColors.cartBG,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  5.height,
                  CommonImage(
                    imageSrc: product.image,
                    width: constrains.maxWidth * .9,
                    height: constrains.maxHeight * .55,
                    fill: BoxFit.fill,
                  ).center,
                  const Spacer(),
                  CommonText(
                    text: product.name,
                    textAlign: TextAlign.start,
                    style: getTheme.textTheme.titleSmall,
                    left: 5,
                    right: 5,
                  ),
                  CommonText(
                    text: '${AppString.monySign} ${product.price}',
                    style: getTheme.textTheme.titleSmall?.copyWith(color: AppColors.primaryColor3),
                    left: 5,
                  ),
                  5.height,
                ],
              ),
            ),
          ),
    ),
  );
}
