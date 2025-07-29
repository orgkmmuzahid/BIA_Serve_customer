import 'package:bai_serve/features/vendor/features/vendor_details/repository/vendor_details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'vendor_proof_state.dart';

class VendorProofCubit extends Cubit<VendorProofState> {
  VendorProofCubit() : super(const VendorProofState());

  VendorDetailsRepository repository = Get.find();

  Future<void> fetch() async {
    emit(const VendorProofState(isLoading: true, vendorProofs: []));

    final response = await repository.fetchVendorProof();
    emit(VendorProofState(vendorProofs: response));
  }

  Future<void> loadMore() async {
    emit(VendorProofState(isLoading: true, vendorProofs: state.vendorProofs));

    final response = await repository.fetchVendorProof();
    emit(VendorProofState(vendorProofs: [...(state.vendorProofs ?? []), ...response]));
  }
}
