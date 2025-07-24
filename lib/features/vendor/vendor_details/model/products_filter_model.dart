// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';


class ProductFilterModel {

  final List<String> productFilters;

  final String selectedFilter;
  ProductFilterModel({
    required this.productFilters,
    required this.selectedFilter,
  });
   

  ProductFilterModel copyWith({
    List<String>? productFilters,
    String? selectedFilter,
  }) {
    return ProductFilterModel(
      productFilters: productFilters ?? this.productFilters,
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productFilters': productFilters,
      'selectedFilter': selectedFilter,
    };
  }

  factory ProductFilterModel.fromMap(Map<String, dynamic> map) {
    return ProductFilterModel(
      productFilters: List<String>.from(map['productFilters'] as List<String>),
      selectedFilter: map['selectedFilter'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductFilterModel.fromJson(String source) => ProductFilterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductsWithfilterModel(productFilters: $productFilters, selectedFilter: $selectedFilter)';

  @override
  bool operator ==(covariant ProductFilterModel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.productFilters, productFilters) &&
      other.selectedFilter == selectedFilter;
  }

  @override
  int get hashCode => productFilters.hashCode ^ selectedFilter.hashCode;
}
