// ignore_for_file: public_member_api_docs, sort_constructors_first
// File: tracking_order_model.dart

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:bai_serve/features/home/model/order_list_model.dart';
import 'package:bai_serve/features/tracking_order/model/order_timeline_model.dart';

class TrackingOrderModel {
  String trackingId;
  String senderName; 
  String phoneNumber;

  String reciverName;
  String reciverPhoneNumber;
  String address;
  //enum
  DeliveryStatus status;

  //duration
  Duration estimatedDeliveryTime;
  
  int stepNumber;

  String image;

  List<OrderTimelineModel> timeline;
  TrackingOrderModel({
    required this.trackingId,
    required this.senderName,
    required this.phoneNumber,
    required this.reciverName,
    required this.reciverPhoneNumber,
    required this.address,
    required this.status,
    required this.estimatedDeliveryTime,
    required this.stepNumber,
    required this.image,
    required this.timeline,
  });

  TrackingOrderModel copyWith({
    String? trackingId,
    String? senderName,
    String? phoneNumber,
    String? reciverName,
    String? reciverPhoneNumber,
    String? address,
    DeliveryStatus? status,
    Duration? estimatedDeliveryTime,
    int? stepNumber,
    String? image,
    List<OrderTimelineModel>? timeline,
  }) {
    return TrackingOrderModel(
      trackingId: trackingId ?? this.trackingId,
      senderName: senderName ?? this.senderName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      reciverName: reciverName ?? this.reciverName,
      reciverPhoneNumber: reciverPhoneNumber ?? this.reciverPhoneNumber,
      address: address ?? this.address,
      status: status ?? this.status,
      estimatedDeliveryTime: estimatedDeliveryTime ?? this.estimatedDeliveryTime,
      stepNumber: stepNumber ?? this.stepNumber,
      image: image ?? this.image,
      timeline: timeline ?? this.timeline,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'trackingId': trackingId,
      'senderName': senderName,
      'phoneNumber': phoneNumber,
      'reciverName': reciverName,
      'reciverPhoneNumber': reciverPhoneNumber,
      'address': address,
      'status': status.index,
      'estimatedDeliveryTime': estimatedDeliveryTime.inMilliseconds,
      'stepNumber': stepNumber,
      'image': image,
      'timeline': timeline.map((x) => x.toMap()).toList(),
    };
  }

  factory TrackingOrderModel.fromMap(Map<String, dynamic> map) {
    return TrackingOrderModel(
      trackingId: map['trackingId'] as String,
      senderName: map['senderName'] as String,
      phoneNumber: map['phoneNumber'] as String,
      reciverName: map['reciverName'] as String,
      reciverPhoneNumber: map['reciverPhoneNumber'] as String,
      address: map['address'] as String,
      status: DeliveryStatus.values[map['status'] as int],
      estimatedDeliveryTime:  Duration(milliseconds: map['estimatedDeliveryTime']),
      stepNumber: map['stepNumber'] as int,
      image: map['image'] as String,
      timeline: List<OrderTimelineModel>.from((map['timeline'] as List<int>).map<OrderTimelineModel>((x) => OrderTimelineModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory TrackingOrderModel.fromJson(String source) => TrackingOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TrackingOrderModel(trackingId: $trackingId, senderName: $senderName, phoneNumber: $phoneNumber, reciverName: $reciverName, reciverPhoneNumber: $reciverPhoneNumber, address: $address, status: $status, estimatedDeliveryTime: $estimatedDeliveryTime, stepNumber: $stepNumber, image: $image, timeline: $timeline)';
  }

  @override
  bool operator ==(covariant TrackingOrderModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.trackingId == trackingId &&
      other.senderName == senderName &&
      other.phoneNumber == phoneNumber &&
      other.reciverName == reciverName &&
      other.reciverPhoneNumber == reciverPhoneNumber &&
      other.address == address &&
      other.status == status &&
      other.estimatedDeliveryTime == estimatedDeliveryTime &&
      other.stepNumber == stepNumber &&
      other.image == image &&
      listEquals(other.timeline, timeline);
  }

  @override
  int get hashCode {
    return trackingId.hashCode ^
      senderName.hashCode ^
      phoneNumber.hashCode ^
      reciverName.hashCode ^
      reciverPhoneNumber.hashCode ^
      address.hashCode ^
      status.hashCode ^
      estimatedDeliveryTime.hashCode ^
      stepNumber.hashCode ^
      image.hashCode ^
      timeline.hashCode;
  }
}
