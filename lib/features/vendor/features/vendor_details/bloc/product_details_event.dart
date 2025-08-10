import 'package:flutter/material.dart';

sealed class ProductDetailsEvent {}

class ProductDetailsFetched extends ProductDetailsEvent {
  ProductDetailsFetched({required this.productId});

  final String productId;
}

class ProductDetailsOnColorSelectionChanged extends ProductDetailsEvent {
  ProductDetailsOnColorSelectionChanged({required this.color});

  final Color color;
}

class ProductDetailsOnSizeSelectionChanged extends ProductDetailsEvent {
  ProductDetailsOnSizeSelectionChanged({required this.size});

  final double size;
}
