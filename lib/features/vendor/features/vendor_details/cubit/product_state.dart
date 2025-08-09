// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../model/product_model.dart';

class ProductState extends Equatable {
  const ProductState({this.isLoading = false, this.products, this.page = 0});

  final bool isLoading;
  final int page;
  final List<ProductModel>? products;

  ProductState copyWith({bool? isLoading, List<ProductModel>? products, int? page}) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [isLoading, products ?? [], page];
}
