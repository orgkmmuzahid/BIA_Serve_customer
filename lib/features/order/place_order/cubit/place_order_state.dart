// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bai_serve_customer/features/order/place_order/model/place_order_model.dart';
import 'package:equatable/equatable.dart';

import '../enum/delivery_type.dart';

class PlaceOrderState extends Equatable {
  const PlaceOrderState({
    this.coupon,
    this.deliveryType = DeliveryType.regular,
    this.placeOrderModel = const PlaceOrderModel(),
  });

  final String? coupon;
  final DeliveryType deliveryType;
  final PlaceOrderModel placeOrderModel;

  PlaceOrderState copyWith({String? coupon, DeliveryType? deliveryType}) {
    return PlaceOrderState(coupon: coupon ?? this.coupon, deliveryType: deliveryType ?? this.deliveryType);
  }

  @override
  List<Object> get props => [coupon ?? '', deliveryType];
}
