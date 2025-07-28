// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../model/return_product_model.dart';

class ReturnProductListState extends Equatable {
  final List<ReturnProductModel> returnProducts;
  final bool isLoading;
  const ReturnProductListState({required this.isLoading, required this.returnProducts});

  ReturnProductListState copyWith({List<ReturnProductModel>? returnProducts, bool? isLoading}) {
    return ReturnProductListState(
      returnProducts: returnProducts ?? this.returnProducts,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [returnProducts, isLoading];
}
