// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductDetailsModel {
  String id;
  String name;
  String description;
  double price;
  String status;
  List<double> availableSizes;
  List<Color> availableColors; //Colors.amber.toARGB32()
  String image;
  ProductDetailsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.status,
    required this.availableSizes,
    required this.availableColors,
    required this.image,
  });

  ProductDetailsModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? status,
    List<double>? availableSizes,
    List<Color>? availableColors,
    String? image,
  }) {
    return ProductDetailsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      status: status ?? this.status,
      availableSizes: availableSizes ?? this.availableSizes,
      availableColors: availableColors ?? this.availableColors,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'status': status,
      'availableSizes': availableSizes,
      'availableColors': availableColors.map((x) => x.toARGB32()).toList(),
      'image': image,
    };
  }

  factory ProductDetailsModel.fromMap(Map<String, dynamic> map) {
    return ProductDetailsModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      status: map['status'] as String,
      availableSizes: List<double>.from(map['availableSizes'] as List<double>),
      availableColors: List<Color>.from(
        (map['availableColors'] as List<int>).map<Color>(Color.new),
      ),
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDetailsModel.fromJson(String source) =>
      ProductDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductDetailsModel(id: $id, name: $name, description: $description, price: $price, status: $status, availableSizes: $availableSizes, availableColors: $availableColors, image: $image)';
  }

  @override
  bool operator ==(covariant ProductDetailsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.status == status &&
        listEquals(other.availableSizes, availableSizes) &&
        listEquals(other.availableColors, availableColors) &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        status.hashCode ^
        availableSizes.hashCode ^
        availableColors.hashCode ^
        image.hashCode;
  }
}
