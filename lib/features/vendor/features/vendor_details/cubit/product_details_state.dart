// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../model/product_details_model.dart';

class ProductDetailsState extends Equatable {
  const ProductDetailsState({this.isLoading = false, this.model});

  final bool isLoading;
  final ProductDetailsModel? model;

  ProductDetailsState copyWith({bool? isLoading, ProductDetailsModel? model}) {
    return ProductDetailsState(isLoading: isLoading ?? this.isLoading, model: model ?? this.model);
  }

  @override
  List<Object> get props => [isLoading, model ?? ''];
}
