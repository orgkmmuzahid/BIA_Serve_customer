import 'package:bai_serve_customer/config/bloc/safe_cubit.dart';
import 'package:bai_serve_customer/features/order/place_order/enum/delivery_type.dart';

import 'place_order_state.dart';

class PlaceOrderCubit extends SafeCubit<PlaceOrderState> {
  PlaceOrderCubit() : super(const PlaceOrderState());
  Future<void> claimCoupon() async {
    emit(state.copyWith(coupon: '125F2'));
  }

  Future<void> onDeliveryTypeChange(DeliveryType deliveryType) async {
    emit(state.copyWith(deliveryType: deliveryType));
  }
}
