// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum VerificationStatus{verified, unverified}

class VendorModel {
  String id;
  String name;
  String image;
  String phoneNumber;
  //enum
  VerificationStatus verificationStatus;
  VendorModel({
    required this.id,
    required this.name,
    required this.image,
    required this.phoneNumber,
    required this.verificationStatus,
  });

  VendorModel copyWith({
    String? id,
    String? name,
    String? image,
    String? phoneNumber,
    VerificationStatus? verificationStatus,
  }) {
    return VendorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      verificationStatus: verificationStatus ?? this.verificationStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'phoneNumber': phoneNumber,
      'verificationStatus': verificationStatus.index,
    };
  }

  factory VendorModel.fromMap(Map<String, dynamic> map) {
    return VendorModel(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      phoneNumber: map['phoneNumber'] as String,
      verificationStatus: VerificationStatus.values[map['verificationStatus'] as int],
    );
  }

  String toJson() => json.encode(toMap());

  factory VendorModel.fromJson(String source) => VendorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VendorModel(id: $id, name: $name, image: $image, phoneNumber: $phoneNumber, verificationStatus: $verificationStatus)';
  }

  @override
  bool operator ==(covariant VendorModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.image == image &&
      other.phoneNumber == phoneNumber &&
      other.verificationStatus == verificationStatus;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      image.hashCode ^
      phoneNumber.hashCode ^
      verificationStatus.hashCode;
  }
}
