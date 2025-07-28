import 'package:bai_serve/config/dependency/dependency_injection.dart';
import 'package:bai_serve/features/vendor/features/verify_vendor/model/vendor_verification_details_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/verify_vendor_repository.dart';

part 'vendor_verification_details_state.dart';

class VendorVerificationDetailsCubit extends Cubit<VendorVerificationDetailsState> {
  VendorVerificationDetailsCubit() : super(VendorVerificationIntial());
  final VerifyVendorRepository _verifyVendorRepository = getIt();

  Future<void> fetch({required String id}) async {
    emit(VendorVerificationLoding());
    final response = await _verifyVendorRepository.verificationDetails(vendorId: id);
    emit(VendorVerificationLodingSuccess(vendorVerificationDetails: response));
  }
}
