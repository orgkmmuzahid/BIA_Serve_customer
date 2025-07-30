// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bai_serve_customer/features/vendor/common_model/vendor_model.dart';
import 'package:bai_serve_customer/features/vendor/common_widget/category_selector/category_model.dart';
import 'package:equatable/equatable.dart';

///VendorListFetched
///VendorListLoadMoreRequested
abstract class VendorListBlocEvent {}

class VendorListFetched extends Equatable implements VendorListBlocEvent {
  final CategoryModel? categoryModel;
  final List<VerificationStatus>? filters;
  const VendorListFetched({this.categoryModel, this.filters});
  @override
  List<Object?> get props => [categoryModel, filters];
}

class VendorListLoadMoreRequested extends Equatable implements VendorListBlocEvent {
  final CategoryModel? categoryModel;
  final List<VerificationStatus>? filters;
  const VendorListLoadMoreRequested({this.categoryModel, this.filters});

  @override
  List<Object?> get props => [categoryModel, filters];
}
