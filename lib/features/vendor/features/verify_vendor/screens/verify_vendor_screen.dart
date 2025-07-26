// File: verify_vendor_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/common/vendor_avater_widget.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
import 'package:bai_serve/features/vendor/common_model/vendor_model.dart';
import 'package:bai_serve/features/vendor/common_widget/category_selector/product_cateogry_widget.dart';
import 'package:bai_serve/features/vendor/features/verify_vendor/bloc/vendor_verification_bloc/vendor_list_bloc.dart';
import 'package:bai_serve/features/vendor/features/verify_vendor/bloc/vendor_verification_bloc/vendor_list_bloc_event.dart';
import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:staggered_grid_view/flutter_staggered_grid_view.dart';

@RoutePage()
class VerifyVendorScreen extends StatelessWidget {
  const VerifyVendorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: AppString.allVendors),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: BlocProvider(
          create: (context) => VendorListBloc(),
          child: BlocBuilder<VendorListBloc, VendorListBlocState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Positioned.fill(child: _content(context.read<VendorListBloc>(), state)),
                  Positioned(
                    bottom: 20,
                    right: 5,
                    child: CommonButton(
                      titleText: AppString.verifyVendor,
                      buttonWidth: 150,
                      onTap: () {
                        appRouter.push(VendorVerifyFormRoute());
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Column _content(VendorListBloc bloc, VendorListBlocState state) {
    return Column(
      children: [
        CommonText(text: AppString.productCategory, style: getTheme.textTheme.bodyLarge, bottom: 10),

        ProductCateogryWidget(onChange: (value) {}),
        // CommonDropDown<String>(
        //   hint: AppString.productCategory,
        //   items: verifyVendorController.vendorCategories,
        //   initailItem: verifyVendorController.selectedVendorCategory,
        //   onChanged: (value) => verifyVendorController.onVendorCategoryChange(value ?? ''),
        //   nameBuilder: (value) => value,
        // ),
        10.height,
        _filters(bloc),
        10.height,
        if (state is VendorListLoadingSuccess)
          Expanded(
            child: StaggeredGridView.extentBuilder(
              physics: const BouncingScrollPhysics(),
              maxCrossAxisExtent: 90,
              itemCount: state.vendors.length,
              itemBuilder: (context, index) => VendorAvaterWidget(model: state.vendors[index]),
              staggeredTileBuilder: (index) => const StaggeredTile.count(1, 1.4),
            ),
          ),
      ],
    );
  }

  Widget _filters(VendorListBloc bloc) {
    final double buttonWidth = ((Utils.deviceSize.width - 32) / AppString.vendorFilters.length) - 5;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            VerificationStatus.values
                .map(
                  (value) => Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: GestureDetector(
                      onTap: () {
                        bloc.add(VendorListFetched(filterByVerification: value));
                      },
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: buttonWidth),
                        child: CommonText(
                          text: value.displayName,
                          borderColor: AppColors.serfeceBG,
                          top: 10,
                          bottom: 10,
                          left: 10,
                          right: 10,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          alignment: MainAxisAlignment.center,
                          // backgroundColor: controller.vendorFetchType == value ? AppColors.lightRead : AppColors.cartBG,
                          color: AppColors.primaryText,
                          // buttonWidth: buttonWidth,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
