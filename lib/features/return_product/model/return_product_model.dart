// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// File: return_product_model.dart

class ReturnProductModel {
  String id;
  String name;
  DateTime orderPlacedAt;
  DateTime pickedUpAt;
  DateTime inTransit;
  int quantity;
  String image;
  double totalPrice;
  ReturnProductModel({
    required this.id,
    required this.name,
    required this.orderPlacedAt,
    required this.pickedUpAt,
    required this.inTransit,
    required this.quantity,
    required this.image,
    required this.totalPrice,
  });

  ReturnProductModel copyWith({
    String? id,
    String? name,
    DateTime? orderPlacedAt,
    DateTime? pickedUpAt,
    DateTime? inTransit,
    int? quantity,
    String? image,
    double? totalPrice,
  }) {
    return ReturnProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      orderPlacedAt: orderPlacedAt ?? this.orderPlacedAt,
      pickedUpAt: pickedUpAt ?? this.pickedUpAt,
      inTransit: inTransit ?? this.inTransit,
      quantity: quantity ?? this.quantity,
      image: image ?? this.image,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'orderPlacedAt': orderPlacedAt.millisecondsSinceEpoch,
      'pickedUpAt': pickedUpAt.millisecondsSinceEpoch,
      'inTransit': inTransit.millisecondsSinceEpoch,
      'quantity': quantity,
      'image': image,
      'totalPrice': totalPrice,
    };
  }

  factory ReturnProductModel.fromMap(Map<String, dynamic> map) {
    return ReturnProductModel(
      id: map['id'] as String,
      name: map['name'] as String,
      orderPlacedAt: DateTime.fromMillisecondsSinceEpoch(map['orderPlacedAt'] as int),
      pickedUpAt: DateTime.fromMillisecondsSinceEpoch(map['pickedUpAt'] as int),
      inTransit: DateTime.fromMillisecondsSinceEpoch(map['inTransit'] as int),
      quantity: map['quantity'] as int,
      image: map['image'] as String,
      totalPrice: map['totalPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReturnProductModel.fromJson(String source) =>
      ReturnProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReturnProductModel(id: $id, name: $name, orderPlacedAt: $orderPlacedAt, pickedUpAt: $pickedUpAt, inTransit: $inTransit, quantity: $quantity, image: $image, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(covariant ReturnProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.orderPlacedAt == orderPlacedAt &&
        other.pickedUpAt == pickedUpAt &&
        other.inTransit == inTransit &&
        other.quantity == quantity &&
        other.image == image &&
        other.totalPrice == totalPrice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        orderPlacedAt.hashCode ^
        pickedUpAt.hashCode ^
        inTransit.hashCode ^
        quantity.hashCode ^
        image.hashCode ^
        totalPrice.hashCode;
  }
}
