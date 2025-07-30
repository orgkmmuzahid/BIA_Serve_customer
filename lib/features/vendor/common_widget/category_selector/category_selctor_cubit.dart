import 'package:bai_serve_customer/config/dependency/dependency_injection.dart';
import 'package:bai_serve_customer/features/vendor/common_widget/category_selector/category_selctor_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_selector_state.dart';

class CategorySelectorCubit extends Cubit<CategorySelectorState> {
  CategorySelectorCubit() : super(const CategorySelectorInitial());
  final CategorySelctorRepository _repository = getIt();

  Future<void> fetchCategories() async {
    emit(const CategorySelectorLoading());
    final response = await _repository.fetch();
    emit(CategorySelectorLoaded(category: response));
  }
}
