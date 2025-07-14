// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderDetailsModel {
  String orderCode;
  String customer;
  String phoneNumber;
  String shippingAddress;
  String productDetails;
  double weight;
  int quantity;
  DateTime orderDate;
  String orderStatus;
  double totalPrice;
  double deliveryCharge;
  double discountPercentage;
  OrderDetailsModel({
    required this.orderCode,
    required this.customer,
    required this.phoneNumber,
    required this.shippingAddress,
    required this.productDetails,
    required this.weight,
    required this.quantity,
    required this.orderDate,
    required this.orderStatus,
    required this.totalPrice,
    required this.deliveryCharge,
    required this.discountPercentage,
  });

  OrderDetailsModel copyWith({
    String? orderCode,
    String? customer,
    String? phoneNumber,
    String? shippingAddress,
    String? productDetails,
    double? weight,
    int? quantity,
    DateTime? orderDate,
    String? orderStatus,
    double? totalPrice,
    double? deliveryCharge,
    double? discountPercentage,
  }) {
    return OrderDetailsModel(
      orderCode: orderCode ?? this.orderCode,
      customer: customer ?? this.customer,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      productDetails: productDetails ?? this.productDetails,
      weight: weight ?? this.weight,
      quantity: quantity ?? this.quantity,
      orderDate: orderDate ?? this.orderDate,
      orderStatus: orderStatus ?? this.orderStatus,
      totalPrice: totalPrice ?? this.totalPrice,
      deliveryCharge: deliveryCharge ?? this.deliveryCharge,
      discountPercentage: discountPercentage ?? this.discountPercentage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderCode': orderCode,
      'customer': customer,
      'phoneNumber': phoneNumber,
      'shippingAddress': shippingAddress,
      'productDetails': productDetails,
      'weight': weight,
      'quantity': quantity,
      'orderDate': orderDate.millisecondsSinceEpoch,
      'orderStatus': orderStatus,
      'totalPrice': totalPrice,
      'deliveryCharge': deliveryCharge,
      'discountPercentage': discountPercentage,
    };
  }

  factory OrderDetailsModel.fromMap(Map<String, dynamic> map) {
    return OrderDetailsModel(
      orderCode: map['orderCode'] as String,
      customer: map['customer'] as String,
      phoneNumber: map['phoneNumber'] as String,
      shippingAddress: map['shippingAddress'] as String,
      productDetails: map['productDetails'] as String,
      weight: map['weight'] as double,
      quantity: map['quantity'] as int,
      orderDate: DateTime.fromMillisecondsSinceEpoch(map['orderDate'] as int),
      orderStatus: map['orderStatus'] as String,
      totalPrice: map['totalPrice'] as double,
      deliveryCharge: map['deliveryCharge'] as double,
      discountPercentage: map['discountPercentage'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderDetailsModel.fromJson(String source) => OrderDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderDetailsModel(orderCode: $orderCode, customer: $customer, phoneNumber: $phoneNumber, shippingAddress: $shippingAddress, productDetails: $productDetails, weight: $weight, quantity: $quantity, orderDate: $orderDate, orderStatus: $orderStatus, totalPrice: $totalPrice, deliveryCharge: $deliveryCharge, discountPercentage: $discountPercentage)';
  }

  @override
  bool operator ==(covariant OrderDetailsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.orderCode == orderCode &&
      other.customer == customer &&
      other.phoneNumber == phoneNumber &&
      other.shippingAddress == shippingAddress &&
      other.productDetails == productDetails &&
      other.weight == weight &&
      other.quantity == quantity &&
      other.orderDate == orderDate &&
      other.orderStatus == orderStatus &&
      other.totalPrice == totalPrice &&
      other.deliveryCharge == deliveryCharge &&
      other.discountPercentage == discountPercentage;
  }

  @override
  int get hashCode {
    return orderCode.hashCode ^
      customer.hashCode ^
      phoneNumber.hashCode ^
      shippingAddress.hashCode ^
      productDetails.hashCode ^
      weight.hashCode ^
      quantity.hashCode ^
      orderDate.hashCode ^
      orderStatus.hashCode ^
      totalPrice.hashCode ^
      deliveryCharge.hashCode ^
      discountPercentage.hashCode;
  }
}
