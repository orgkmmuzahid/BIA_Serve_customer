// File: return_product_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/other_widgets/smart_list_loader.dart';
import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
import 'package:bai_serve/features/return_product/cubit/return_product_list_cubit.dart';
import 'package:bai_serve/features/return_product/cubit/return_product_list_state.dart';
import 'package:bai_serve/features/return_product/widgets/return_product_builder_widget.dart';
import 'package:bai_serve/utils/constants/app_string.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//  AutoRoute(page: ReturnProductRoute.page),

@RoutePage()
class ReturnProductScreen extends StatelessWidget {
  const ReturnProductScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CommonAppBar(title: AppString.drawerReturnsProduct),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocProvider(
        create: (_) => ReturnProductListCubit()..fetch(),
        child: BlocBuilder<ReturnProductListCubit, ReturnProductListState>(
          builder: (context, state) {
            final bloc = context.read<ReturnProductListCubit>();
            return SmartListLoader(
              itemCount: state.returnProducts.length,
              isLoading: state.isLoading,
              onLoadMore: bloc.loadMore,
              onRefresh: bloc.fetch,
              itemBuilder: (_, index) {
                final product = state.returnProducts[index];
                return ReturnProductBuilderWidget(
                  returnProduct: product,
                  ontap: () => appRouter.push(ReturnProductDetailsRoute(returnProductModel: product)),
                );
              },
            );
          },
        ),
      ),
    ),
  );
}
