// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum VerificationStatus { verified, unverified, pending }

class VendorModel {
  final String name;
  final String id;
  final String address;
  final DateTime applyDate;
  final String phoneNumber;
  //enum
  final VerificationStatus status;
  final String image;
  VendorModel({
    required this.name,
    required this.id,
    required this.address,
    required this.applyDate,
    required this.phoneNumber,
    required this.status,
    required this.image,
  });

  VendorModel copyWith({
    String? name,
    String? id,
    String? address,
    DateTime? applyDate,
    String? phoneNumber,
    VerificationStatus? status,
    String? image,
  }) {
    return VendorModel(
      name: name ?? this.name,
      id: id ?? this.id,
      address: address ?? this.address,
      applyDate: applyDate ?? this.applyDate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'address': address,
      'applyDate': applyDate.millisecondsSinceEpoch,
      'phoneNumber': phoneNumber,
      'status': status.index,
      'image': image,
    };
  }

  factory VendorModel.fromMap(Map<String, dynamic> map) {
    return VendorModel(
      name: map['name'] as String,
      id: map['id'] as String,
      address: map['address'] as String,
      applyDate: DateTime.fromMillisecondsSinceEpoch(map['applyDate'] as int),
      phoneNumber: map['phoneNumber'] as String,
      status: VerificationStatus.values[map['status'] as int],
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VendorModel.fromJson(String source) => VendorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VendorModel(name: $name, id: $id, address: $address, applyDate: $applyDate, phoneNumber: $phoneNumber, status: $status, image: $image)';
  }

  @override
  bool operator ==(covariant VendorModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id == id &&
        other.address == address &&
        other.applyDate == applyDate &&
        other.phoneNumber == phoneNumber &&
        other.status == status &&
        other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        address.hashCode ^
        applyDate.hashCode ^
        phoneNumber.hashCode ^
        status.hashCode ^
        image.hashCode;
  }
}
