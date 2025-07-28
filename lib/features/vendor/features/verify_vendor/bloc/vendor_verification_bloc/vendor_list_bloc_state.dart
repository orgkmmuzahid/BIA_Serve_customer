// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'vendor_list_bloc.dart';

///VendorListInital
///VendorListLoading
///VendorListLoadingSuccess

class VendorListBlocState extends Equatable {
  const VendorListBlocState(this.vendors, this.isLoading, this.filters);

  final List<VendorModel> vendors;

  final bool isLoading;

  final List<VerificationStatus>? filters;

  @override
  List<Object> get props => [vendors, isLoading, filters ?? []];

  VendorListBlocState copyWith({List<VendorModel>? vendors, bool? isLoading, List<VerificationStatus>? filters}) {
    return VendorListBlocState(vendors ?? this.vendors, isLoading ?? this.isLoading, filters ?? this.filters);
  }
}
