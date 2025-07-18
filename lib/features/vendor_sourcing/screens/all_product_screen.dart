import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/features/vendor_sourcing/controllers/vendor_sourcing_controller.dart';
import 'package:bai_serve/features/vendor_sourcing/widgets/product_builder_widget.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:staggered_grid_view/flutter_staggered_grid_view.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CommonAppBar(title: AppString.allProducts),
    body: Padding(padding: EdgeInsets.only(left: 16, right: 16), 
     child:  GetBuilder<VendorSourcingController>(
       builder: (vendorSourcingController) {
         return StaggeredGridView.extentBuilder(
                      shrinkWrap: true,
                      maxCrossAxisExtent: 200,
                      itemCount: vendorSourcingController.products.length,
                     itemBuilder: (context, index) => ProductBuilderWidget(product: vendorSourcingController.products[index]),
                      staggeredTileBuilder: (index) =>
            StaggeredTile.count(1,1));
       }
     ),
    ),
  );
}