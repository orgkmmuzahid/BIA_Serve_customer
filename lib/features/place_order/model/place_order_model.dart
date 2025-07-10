// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// File: place_order_model.dart

class PlaceOrderModel {
  String? marchentPickupTime;
  String? clientPickupTime;
  double? productWieght;
  int? quantity;
  PlaceOrderModel({
    this.marchentPickupTime,
    this.clientPickupTime,
    this.productWieght,
    this.quantity,
  });


  PlaceOrderModel copyWith({
    String? marchentPickupTime,
    String? clientPickupTime,
    double? productWieght,
    int? quantity,
  }) {
    return PlaceOrderModel(
      marchentPickupTime: marchentPickupTime ?? this.marchentPickupTime,
      clientPickupTime: clientPickupTime ?? this.clientPickupTime,
      productWieght: productWieght ?? this.productWieght,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'marchentPickupTime': marchentPickupTime,
      'clientPickupTime': clientPickupTime,
      'productWieght': productWieght,
      'quantity': quantity,
    };
  }

  factory PlaceOrderModel.fromMap(Map<String, dynamic> map) {
    return PlaceOrderModel(
      marchentPickupTime: map['marchentPickupTime'] != null ? map['marchentPickupTime'] as String : null,
      clientPickupTime: map['clientPickupTime'] != null ? map['clientPickupTime'] as String : null,
      productWieght: map['productWieght'] != null ? map['productWieght'] as double : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaceOrderModel.fromJson(String source) => PlaceOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PlaceOrderModel(marchentPickupTime: $marchentPickupTime, clientPickupTime: $clientPickupTime, productWieght: $productWieght, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant PlaceOrderModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.marchentPickupTime == marchentPickupTime &&
      other.clientPickupTime == clientPickupTime &&
      other.productWieght == productWieght &&
      other.quantity == quantity;
  }

  @override
  int get hashCode {
    return marchentPickupTime.hashCode ^
      clientPickupTime.hashCode ^
      productWieght.hashCode ^
      quantity.hashCode;
  }
}
