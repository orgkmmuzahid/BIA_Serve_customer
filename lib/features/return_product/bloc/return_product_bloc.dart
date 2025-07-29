import 'package:bai_serve/config/dependency/dependency_injection.dart';
import 'package:bai_serve/features/return_product/model/pickup_address_model.dart';
import 'package:bai_serve/features/return_product/repository/return_product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'return_product_event.dart';
part 'return_product_state.dart';

class ReturnProductBloc extends Bloc<ReturnProductEvent, ReturnProductState> {
  ReturnProductBloc() : super(ReturnProductInital()) {
    final ReturnProductRepository repository = getIt();

    on<PickupAddressFetched>((event, emit) async {
      emit(PickupAddressFetchSuccess(isLoading: true));
      final response = await repository.getPickupAddress();
      emit(PickupAddressFetchSuccess(pickupAddressModel: response));
    });
  }
}
