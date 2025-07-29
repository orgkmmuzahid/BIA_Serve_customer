// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PickupAddressModel {
  String name;
  String phoneNumber;
  String address;
  PickupAddressModel({required this.name, required this.phoneNumber, required this.address});

  PickupAddressModel copyWith({String? name, String? phoneNumber, String? address}) {
    return PickupAddressModel(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
    );
  }

  factory PickupAddressModel.fromMap(Map<String, dynamic> map) {
    return PickupAddressModel(
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      address: map['address'] as String,
    );
  }

  factory PickupAddressModel.fromJson(String source) =>
      PickupAddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PickupAddressModel(name: $name, phoneNumber: $phoneNumber, address: $address)';

  @override
  bool operator ==(covariant PickupAddressModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.phoneNumber == phoneNumber && other.address == address;
  }

  @override
  int get hashCode => name.hashCode ^ phoneNumber.hashCode ^ address.hashCode;
}
