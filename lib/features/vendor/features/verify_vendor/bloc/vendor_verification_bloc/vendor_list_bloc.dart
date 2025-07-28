import 'dart:async';

import 'package:bai_serve/config/dependency/dependency_injection.dart';
import 'package:bai_serve/features/vendor/common_model/vendor_model.dart';
import 'package:bai_serve/features/vendor/features/verify_vendor/repository/verify_vendor_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'vendor_list_bloc_event.dart';

part 'vendor_list_bloc_state.dart';

/// **Events**
/// `VendorListFetched`
/// `VendorListLoadMoreRequested`
///
///  **States**
/// `VendorListInital`
/// `VendorListLoading`
/// `VendorListLoadingSuccess`
class VendorListBloc extends Bloc<VendorListBlocEvent, VendorListBlocState> {
  VendorListBloc() : super(const VendorListBlocState([], false, [])) {
    on<VendorListFetched>(_onLoadVendors);
    on<VendorListLoadMoreRequested>(_onLoadMore);
  }

  final VerifyVendorRepository _verifyVendorRepository = getIt();

  Future<void> _onLoadVendors(VendorListFetched event, Emitter<VendorListBlocState> emit) async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true, vendors: [], filters: event.filters));
    final response = await _verifyVendorRepository.vendors(
      productCategory: event.categoryModel,
      filters: event.filters,
    );
    emit(state.copyWith(isLoading: false, vendors: response));
  }

  FutureOr<void> _onLoadMore(VendorListLoadMoreRequested event, Emitter<VendorListBlocState> emit) async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    final response = await _verifyVendorRepository.vendors(
      productCategory: event.categoryModel,
      filters: state.filters,
    );

    emit(state.copyWith(isLoading: false, vendors: [...List.of(state.vendors), ...response]));
  }
}
