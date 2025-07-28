import 'package:auto_route/auto_route.dart';
import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/features/return_product/model/return_product_model.dart';
import 'package:bai_serve/features/return_product/widgets/return_product_builder_widget.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ReturnProductDetailsScreen extends StatelessWidget {
  const ReturnProductDetailsScreen({required this.returnProductModel, super.key});

  final ReturnProductModel returnProductModel;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CommonAppBar(title: AppString.drawerReturnsProduct),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [ReturnProductBuilderWidget(returnProduct: returnProductModel)]),
    ),
  );
}
