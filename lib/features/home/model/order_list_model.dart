// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:bai_serve/utils/enum/enum.dart';

class OrderListModel {
  final String orderNumber;
  final DateTime orderPlacedDate;
  final DateTime percelPickedUp;
  final DateTime inTransition;
  //enum
  final OrderProgress orderProgress;
  final String outForDelivery;
  OrderListModel({
    required this.orderNumber,
    required this.orderPlacedDate,
    required this.percelPickedUp,
    required this.inTransition,
    required this.orderProgress,
    required this.outForDelivery,
  });

  OrderListModel copyWith({
    String? orderNumber,
    DateTime? orderPlacedDate,
    DateTime? percelPickedUp,
    DateTime? inTransition,
    OrderProgress? orderProgress,
    String? outForDelivery,
  }) {
    return OrderListModel(
      orderNumber: orderNumber ?? this.orderNumber,
      orderPlacedDate: orderPlacedDate ?? this.orderPlacedDate,
      percelPickedUp: percelPickedUp ?? this.percelPickedUp,
      inTransition: inTransition ?? this.inTransition,
      orderProgress: orderProgress ?? this.orderProgress,
      outForDelivery: outForDelivery ?? this.outForDelivery,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderNumber': orderNumber,
      'orderPlacedDate': orderPlacedDate.millisecondsSinceEpoch,
      'percelPickedUp': percelPickedUp.millisecondsSinceEpoch,
      'inTransition': inTransition.millisecondsSinceEpoch,
      'orderProgress': orderProgress.index,
      'outForDelivery': outForDelivery,
    };
  }

  factory OrderListModel.fromMap(Map<String, dynamic> map) {
    return OrderListModel(
      orderNumber: map['orderNumber'] as String,
      orderPlacedDate: DateTime.fromMillisecondsSinceEpoch(map['orderPlacedDate'] as int),
      percelPickedUp: DateTime.fromMillisecondsSinceEpoch(map['percelPickedUp'] as int),
      inTransition: DateTime.fromMillisecondsSinceEpoch(map['inTransition'] as int),
      orderProgress: OrderProgress.values[map['orderProgress'] as int],
      outForDelivery: map['outForDelivery'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderListModel.fromJson(String source) => OrderListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderListModel(orderNumber: $orderNumber, orderPlacedDate: $orderPlacedDate, percelPickedUp: $percelPickedUp, inTransition: $inTransition, orderProgress: $orderProgress, outForDelivery: $outForDelivery)';
  }

  @override
  bool operator ==(covariant OrderListModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.orderNumber == orderNumber &&
      other.orderPlacedDate == orderPlacedDate &&
      other.percelPickedUp == percelPickedUp &&
      other.inTransition == inTransition &&
      other.orderProgress == orderProgress &&
      other.outForDelivery == outForDelivery;
  }

  @override
  int get hashCode {
    return orderNumber.hashCode ^
      orderPlacedDate.hashCode ^
      percelPickedUp.hashCode ^
      inTransition.hashCode ^
      orderProgress.hashCode ^
      outForDelivery.hashCode;
  }
}
