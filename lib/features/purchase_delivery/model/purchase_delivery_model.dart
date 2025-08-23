// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// File: purchase_delivery_model.dart

enum RegionType { outSideTheCity, insideTheCity }

class PurchaseDeliveryModel {
  String? name;
  String? vendorId;
  String? phoneNumber;
  double? amount;
  //enum
  RegionType deliveryType;
  String? deliveryAddress;
  String? productDescription;
  double? serviceFee;
  double? totalPay;
  PurchaseDeliveryModel({
    required this.deliveryType,
    this.name,
    this.vendorId,
    this.phoneNumber,
    this.amount,
    this.deliveryAddress,
    this.productDescription,
    this.serviceFee,
    this.totalPay,
  });

  PurchaseDeliveryModel copyWith({
    String? name,
    String? vendorId,
    String? phoneNumber,
    double? amount,
    RegionType? deliveryType,
    String? deliveryAddress,
    String? productDescription,
    double? serviceFee,
    double? totalPay,
  }) {
    return PurchaseDeliveryModel(
      name: name ?? this.name,
      vendorId: vendorId ?? this.vendorId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      amount: amount ?? this.amount,
      deliveryType: deliveryType ?? this.deliveryType,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      productDescription: productDescription ?? this.productDescription,
      serviceFee: serviceFee ?? this.serviceFee,
      totalPay: totalPay ?? this.totalPay,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'vendorId': vendorId,
      'phoneNumber': phoneNumber,
      'amount': amount,
      'deliveryType': deliveryType.index,
      'deliveryAddress': deliveryAddress,
      'productDescription': productDescription,
      'serviceFee': serviceFee,
      'totalPay': totalPay,
    };
  }

  factory PurchaseDeliveryModel.fromMap(Map<String, dynamic> map) {
    return PurchaseDeliveryModel(
      name: map['name'] != null ? map['name'] as String : null,
      vendorId: map['vendorId'] != null ? map['vendorId'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      amount: map['amount'] != null ? map['amount'] as double : null,
      deliveryType: RegionType.values[map['deliveryType'] as int],
      deliveryAddress:
          map['deliveryAddress'] != null
              ? map['deliveryAddress'] as String
              : null,
      productDescription:
          map['productDescription'] != null
              ? map['productDescription'] as String
              : null,
      serviceFee:
          map['serviceFee'] != null ? map['serviceFee'] as double : null,
      totalPay: map['totalPay'] != null ? map['totalPay'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PurchaseDeliveryModel.fromJson(String source) =>
      PurchaseDeliveryModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() {
    return 'PurchaseDeliveryModel(name: $name, vendorId: $vendorId, phoneNumber: $phoneNumber, amount: $amount, deliveryType: $deliveryType, deliveryAddress: $deliveryAddress, productDescription: $productDescription, serviceFee: $serviceFee, totalPay: $totalPay)';
  }

  @override
  bool operator ==(covariant PurchaseDeliveryModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.vendorId == vendorId &&
        other.phoneNumber == phoneNumber &&
        other.amount == amount &&
        other.deliveryType == deliveryType &&
        other.deliveryAddress == deliveryAddress &&
        other.productDescription == productDescription &&
        other.serviceFee == serviceFee &&
        other.totalPay == totalPay;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        vendorId.hashCode ^
        phoneNumber.hashCode ^
        amount.hashCode ^
        deliveryType.hashCode ^
        deliveryAddress.hashCode ^
        productDescription.hashCode ^
        serviceFee.hashCode ^
        totalPay.hashCode;
  }
}
