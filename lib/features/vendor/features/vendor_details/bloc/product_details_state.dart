// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/product_details_model.dart';

class ProductDetailsState extends Equatable {
  const ProductDetailsState({this.isLoading = false, this.model, this.color, this.size});

  final bool isLoading;
  final ProductDetailsModel? model;
  final Color? color;
  final double? size;

  ProductDetailsState copyWith({bool? isLoading, ProductDetailsModel? model, Color? color, double? size}) {
    return ProductDetailsState(
      isLoading: isLoading ?? this.isLoading,
      model: model ?? this.model,
      color: color ?? this.color,
      size: size ?? this.size,
    );
  }

  @override
  List<Object> get props => [isLoading, model ?? '', color ?? '', size ?? ''];
}
