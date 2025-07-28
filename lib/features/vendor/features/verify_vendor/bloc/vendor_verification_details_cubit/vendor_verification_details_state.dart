part of 'vendor_verification_details_cubit.dart';

abstract class VendorVerificationDetailsState extends Equatable {}

class VendorVerificationIntial extends VendorVerificationDetailsState {
  @override
  List<Object?> get props => [];
}

final class VendorVerificationLoding extends VendorVerificationDetailsState {
  @override
  List<Object?> get props => [];
}

final class VendorVerificationLodingSuccess extends VendorVerificationDetailsState {
  VendorVerificationLodingSuccess({required this.vendorVerificationDetails});

  final VendorVerificationDetailsModel vendorVerificationDetails;

  @override
  List<Object?> get props => [vendorVerificationDetails];
}
