import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'vendor_verification_detail_bloc_event.dart';
part 'vendor_verification_detail_bloc_state.dart';

class VendorVerificationDetailBlocBloc extends Bloc<VendorVerificationDetailBlocEvent, VendorVerificationDetailBlocState> {
  VendorVerificationDetailBlocBloc() : super(VendorVerificationDetailBlocInitial()) {
    on<VendorVerificationDetailBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
