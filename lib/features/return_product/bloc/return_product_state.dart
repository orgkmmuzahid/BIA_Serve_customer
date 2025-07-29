// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'return_product_bloc.dart';

abstract class ReturnProductState extends Equatable {}

final class ReturnProductInital extends ReturnProductState {
  @override
  List<Object?> get props => [];
}

class PickupAddressFetchSuccess extends ReturnProductState {
  final PickupAddressModel? pickupAddressModel;
  PickupAddressFetchSuccess({this.pickupAddressModel, this.isLoading = false});
  final bool isLoading;

  PickupAddressFetchSuccess copyWith({PickupAddressModel? pickupAddressModel, bool? isLoading}) {
    return PickupAddressFetchSuccess(
      pickupAddressModel: pickupAddressModel ?? this.pickupAddressModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [isLoading, pickupAddressModel];
}
