import 'package:bai_serve_customer/component/other_widgets/common_drop_down.dart';
import 'package:bai_serve_customer/features/vendor/common_widget/category_selector/category_model.dart';
import 'package:bai_serve_customer/features/vendor/common_widget/category_selector/category_selctor_cubit.dart';
import 'package:bai_serve_customer/features/vendor/common_widget/category_selector/category_selector_state.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCateogryWidget extends StatelessWidget {
  const ProductCateogryWidget({required this.onChange, super.key});
  final Function(BuildContext context, CategoryModel categoryModel) onChange;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategorySelectorCubit()..fetchCategories(),
      child: BlocBuilder<CategorySelectorCubit, CategorySelectorState>(
        builder:
            (_, state) => CommonDropDown<CategoryModel>(
              hint: AppString.productCategory,
              isLoading: state is CategorySelectorLoading,
              items: state is CategorySelectorLoaded ? state.category : [],
              onChanged: (data) {
                if (data != null) {
                  onChange(context, data);
                }
              },
              nameBuilder: (value) => value.name,
            ),
      ),
    );
  }
}
