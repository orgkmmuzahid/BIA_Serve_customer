import 'dart:async';

import 'package:bai_serve/config/dependency/dependency_injection.dart';
import 'package:bai_serve/features/vendor/common_model/vendor_model.dart';
import 'package:bai_serve/features/vendor/features/verify_vendor/repository/verify_vendor_repository.dart';
import 'package:equatable/equatable.dart';
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
  VendorListBloc() : super(VendorListInital()) {
    on<VendorListFetched>(_onLoadVendors);
    on<VendorListLoadMoreRequested>(_onLoadMore);
  }

  final VerifyVendorRepository _verifyVendorRepository = getIt();

  Future<void> _onLoadVendors(VendorListFetched event, Emitter<VendorListBlocState> emit) async {
    emit(VendorListLoading());
    final response = await _verifyVendorRepository.vendors(productCategory: event.categoryModel);
    emit(VendorListLoadingSuccess(response));
  }

  FutureOr<void> _onLoadMore(VendorListLoadMoreRequested event, Emitter<VendorListBlocState> emit) async {
    emit(VendorListLoading());
    final response = await _verifyVendorRepository.vendors(productCategory: event.categoryModel);

    final currentVendors = List<VendorModel>.from((state as VendorListLoadingSuccess).vendors);
    currentVendors.addAll(response);
    emit(VendorListLoadingSuccess(currentVendors));
  }
}
