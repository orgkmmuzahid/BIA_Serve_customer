// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../model/vendor_proof_model.dart';

class VendorProofState extends Equatable {
  const VendorProofState({this.vendorProofs, this.isLoading = false});

  final List<VendorProofModel>? vendorProofs;
  final bool isLoading;

  @override
  List<Object> get props => [vendorProofs ?? [], isLoading];
}
