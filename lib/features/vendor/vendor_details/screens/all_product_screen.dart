import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/features/vendor/vendor_details/widgets/product_gridview_widget.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:flutter/material.dart';
class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: CommonAppBar(title: AppString.allProducts),
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: ProductGridviewWidget(showFilter: false,),
      ),
    ),
  );
}
