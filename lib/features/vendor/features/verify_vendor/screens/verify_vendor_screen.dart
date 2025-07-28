// File: verify_vendor_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/common/vendor_avater_widget.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/common_bar/common_tab_bar.dart';
import 'package:bai_serve/component/other_widgets/smart_staggered_loader.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
import 'package:bai_serve/features/vendor/common_model/vendor_model.dart';
import 'package:bai_serve/features/vendor/common_widget/category_selector/product_cateogry_widget.dart';
import 'package:bai_serve/features/vendor/features/verify_vendor/bloc/vendor_verification_bloc/vendor_list_bloc.dart';
import 'package:bai_serve/features/vendor/features/verify_vendor/bloc/vendor_verification_bloc/vendor_list_bloc_event.dart';
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
          child: Stack(
            children: [
              Positioned.fill(child: LayoutBuilder(builder: (context, covariant) => _content(context))),
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
          ),
        ),
      ),
    );
  }

  Column _content(BuildContext context) {
    return Column(
      children: [
        CommonText(text: AppString.productCategory, style: getTheme.textTheme.bodyLarge, bottom: 10),
        ProductCateogryWidget(
          onChange: (context, value) {
            context.read<VendorListBloc>().add(
              VendorListFetched(
                categoryModel: value,
                filters: const [VerificationStatus.verified, VerificationStatus.unverified],
              ),
            );
          },
        ),
        10.height,
        // _filters(),
        Expanded(
          child: CommonTabBar(
            tabs: AppString.vendorFilters,
            onTabChange: (index) {
              final bloc = BlocProvider.of<VendorListBloc>(context);
              bloc.add(VendorListFetched(filters: index == 0 ? [] : [VerificationStatus.values[index - 1]]));
            },
            tabViews: [
              BlocBuilder<VendorListBloc, VendorListBlocState>(
                buildWhen: (previous, current) => previous.vendors != current.vendors,
                builder: (context, state) {
                  final bloc = context.read<VendorListBloc>();
                  return SmartStaggeredLoader(
                    itemCount: state.vendors.length,
                    maxCrossAxisExtent: 90,
                    isLoading: state.isLoading,
                    staggeredTile: const StaggeredTile.count(1, 1.4),
                    onRefresh: () => bloc.add(VendorListFetched(filters: state.filters)),
                    onLoadMore: () => bloc.add(const VendorListLoadMoreRequested()),
                    itemBuilder: (context, index) => VendorAvaterWidget(model: state.vendors[index]),
                  );
                },
              ),
            ],
          ),
        ),
        10.height,
      ],
    );
  }
}
