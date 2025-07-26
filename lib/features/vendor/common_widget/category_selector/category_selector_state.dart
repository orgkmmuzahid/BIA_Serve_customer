import 'package:bai_serve/features/vendor/common_widget/category_selector/category_model.dart';
import 'package:equatable/equatable.dart';

abstract class CategorySelectorState extends Equatable {
  const CategorySelectorState();

  @override
  List<Object?> get props => [];
}

class CategorySelectorInitial extends CategorySelectorState {
  const CategorySelectorInitial();
}

class CategorySelectorLoading extends CategorySelectorState {
  const CategorySelectorLoading();
}

class CategorySelectorLoaded extends CategorySelectorState {
  const CategorySelectorLoaded({required this.category});
  final List<CategoryModel> category;

  CategorySelectorLoaded copyWith({List<CategoryModel>? category}) {
    return CategorySelectorLoaded(category: category ?? this.category);
  }

  @override
  List<Object> get props => [category];
}
