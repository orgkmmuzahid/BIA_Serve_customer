// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'vendor_list_bloc.dart';

///VendorListInital
///VendorListLoading
///VendorListLoadingSuccess
sealed class VendorListBlocState {}

final class VendorListInital extends VendorListBlocState {}

final class VendorListLoading extends VendorListBlocState {}

class VendorListLoadingSuccess extends Equatable implements VendorListBlocState {
  const VendorListLoadingSuccess(this.vendors);

  final List<VendorModel> vendors;

  @override
  List<Object> get props => [vendors];

  VendorListLoadingSuccess copyWith({List<VendorModel>? vendors}) {
    return VendorListLoadingSuccess(vendors ?? this.vendors);
  }
}
