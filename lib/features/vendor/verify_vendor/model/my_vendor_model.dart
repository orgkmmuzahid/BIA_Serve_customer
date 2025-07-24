// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// File: verify_vendor_model.dart

enum VerifyStatus{pending, verified}

class MyVendorModel {
  String name;
  String id;
  String address;
  DateTime applyDate;
  String phoneNumber;
  //enum
  VerifyStatus verifyStatus;
  String image;
  MyVendorModel({
    required this.name,
    required this.id,
    required this.address,
    required this.applyDate,
    required this.phoneNumber,
    required this.verifyStatus,
    required this.image,
  });

  MyVendorModel copyWith({
    String? name,
    String? id,
    String? address,
    DateTime? applyDate,
    String? phoneNumber,
    VerifyStatus? verifyStatus,
    String? image,
  }) {
    return MyVendorModel(
      name: name ?? this.name,
      id: id ?? this.id,
      address: address ?? this.address,
      applyDate: applyDate ?? this.applyDate,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      verifyStatus: verifyStatus ?? this.verifyStatus,
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
      'verifyStatus': verifyStatus.index,
      'image': image,
    };
  }

  factory MyVendorModel.fromMap(Map<String, dynamic> map) {
    return MyVendorModel(
      name: map['name'] as String,
      id: map['id'] as String,
      address: map['address'] as String,
      applyDate: DateTime.fromMillisecondsSinceEpoch(map['applyDate'] as int),
      phoneNumber: map['phoneNumber'] as String,
      verifyStatus: VerifyStatus.values[map['verifyStatus'] as int],
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyVendorModel.fromJson(String source) => MyVendorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MyVendorModel(name: $name, id: $id, address: $address, applyDate: $applyDate, phoneNumber: $phoneNumber, verifyStatus: $verifyStatus, image: $image)';
  }

  @override
  bool operator ==(covariant MyVendorModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.id == id &&
      other.address == address &&
      other.applyDate == applyDate &&
      other.phoneNumber == phoneNumber &&
      other.verifyStatus == verifyStatus &&
      other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      id.hashCode ^
      address.hashCode ^
      applyDate.hashCode ^
      phoneNumber.hashCode ^
      verifyStatus.hashCode ^
      image.hashCode;
  }
}
