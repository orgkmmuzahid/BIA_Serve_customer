import 'dart:async';
import 'package:bai_serve_customer/config/bloc/safe_bloc.dart';
import 'package:bai_serve_customer/config/dependency/dependency_injection.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/bloc/product_details_event.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_details/repository/vendor_details_repository.dart';

import 'product_details_state.dart';

class ProductDetailsBloc extends SafeBloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(const ProductDetailsState()) {
    on<ProductDetailsFetched>(_onFetch);
    on<ProductDetailsOnColorSelectionChanged>(_onColorChange);
    on<ProductDetailsOnSizeSelectionChanged>(_onSizeChange);
  }

  final VendorDetailsRepository _repository = getIt();

  FutureOr<void> _onFetch(ProductDetailsFetched event, emit) async {
    emit(const ProductDetailsState(isLoading: true));
    final response = await _repository.productDetails(productId: event.productId);
    emit(ProductDetailsState(model: response));
  }

  FutureOr<void> _onColorChange(ProductDetailsOnColorSelectionChanged event, emit) async {
    emit(state.copyWith(color: event.color));
  }

  FutureOr<void> _onSizeChange(ProductDetailsOnSizeSelectionChanged event, emit) async {
    emit(state.copyWith(size: event.size));
  }
}
