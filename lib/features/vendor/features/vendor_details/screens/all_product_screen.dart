import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/common/app_bar/common_app_bar.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/widgets/product_gridview_widget.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(
    appBar: CommonAppBar(title: AppString.allProducts),
    body: const ProductGridviewWidget(),
  );
}
