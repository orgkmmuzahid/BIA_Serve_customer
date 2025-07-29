// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:bai_serve/features/vendor/common_model/vendor_model.dart';

class VendorProofModel {
  String vendorId;
  String name;
  String phone;
  //enum
  VerificationStatus status;
  String profileImage;
  List<String> proofImages;
  String prifileLink;
  VendorProofModel({
    required this.vendorId,
    required this.name,
    required this.phone,
    required this.status,
    required this.profileImage,
    required this.proofImages,
    required this.prifileLink,
  });

  VendorProofModel copyWith({
    String? vendorId,
    String? name,
    String? phone,
    VerificationStatus? status,
    String? profileImage,
    List<String>? proofImages,
    String? prifileLink,
  }) {
    return VendorProofModel(
      vendorId: vendorId ?? this.vendorId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      status: status ?? this.status,
      profileImage: profileImage ?? this.profileImage,
      proofImages: proofImages ?? this.proofImages,
      prifileLink: prifileLink ?? this.prifileLink,
    );
  }

  factory VendorProofModel.fromMap(Map<String, dynamic> map) {
    return VendorProofModel(
      vendorId: map['vendorId'] as String,
      name: map['name'] as String,
      phone: map['phone'] as String,
      status: VerificationStatus.values[map['status'] as int],
      profileImage: map['profileImage'] as String,
      proofImages: List<String>.from((map['proofImages'] as List<String>)),
      prifileLink: map['prifileLink'] as String,
    );
  }

  factory VendorProofModel.fromJson(String source) =>
      VendorProofModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VendorProofModel(vendorId: $vendorId, name: $name, phone: $phone, status: $status, profileImage: $profileImage, proofImages: $proofImages, prifileLink: $prifileLink)';
  }

  @override
  bool operator ==(covariant VendorProofModel other) {
    if (identical(this, other)) return true;

    return other.vendorId == vendorId &&
        other.name == name &&
        other.phone == phone &&
        other.status == status &&
        other.profileImage == profileImage &&
        listEquals(other.proofImages, proofImages) &&
        other.prifileLink == prifileLink;
  }

  @override
  int get hashCode {
    return vendorId.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        status.hashCode ^
        profileImage.hashCode ^
        proofImages.hashCode ^
        prifileLink.hashCode;
  }
}
