// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bai_serve_customer/features/vendor/common_model/vendor_model.dart';
import 'package:flutter/foundation.dart';

class VendorVerificationDetailsModel {
  String vendorName;
  String phoneNumber;
  String venodorLocation;
  double verifciationFee;
  //enum
  VerificationStatus verificationStatus;
  List<String> images;
  VendorVerificationDetailsModel({
    required this.vendorName,
    required this.phoneNumber,
    required this.venodorLocation,
    required this.verifciationFee,
    required this.verificationStatus,
    required this.images,
  });

  VendorVerificationDetailsModel copyWith({
    String? vendorName,
    String? phoneNumber,
    String? venodorLocation,
    double? verifciationFee,
    VerificationStatus? verificationStatus,
    List<String>? images,
  }) {
    return VendorVerificationDetailsModel(
      vendorName: vendorName ?? this.vendorName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      venodorLocation: venodorLocation ?? this.venodorLocation,
      verifciationFee: verifciationFee ?? this.verifciationFee,
      verificationStatus: verificationStatus ?? this.verificationStatus,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'vendorName': vendorName,
      'phoneNumber': phoneNumber,
      'venodorLocation': venodorLocation,
      'verifciationFee': verifciationFee,
      'verificationStatus': verificationStatus.index,
      'images': images,
    };
  }

  factory VendorVerificationDetailsModel.fromMap(Map<String, dynamic> map) {
    return VendorVerificationDetailsModel(
      vendorName: map['vendorName'] as String,
      phoneNumber: map['phoneNumber'] as String,
      venodorLocation: map['venodorLocation'] as String,
      verifciationFee: map['verifciationFee'] as double,
      verificationStatus: VerificationStatus.values[map['verificationStatus'] as int],
      images: List<String>.from((map['images'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory VendorVerificationDetailsModel.fromJson(String source) =>
      VendorVerificationDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VendorVerificationDetailsModel(vendorName: $vendorName, phoneNumber: $phoneNumber, venodorLocation: $venodorLocation, verifciationFee: $verifciationFee, verificationStatus: $verificationStatus, images: $images)';
  }

  @override
  bool operator ==(covariant VendorVerificationDetailsModel other) {
    if (identical(this, other)) return true;

    return other.vendorName == vendorName &&
        other.phoneNumber == phoneNumber &&
        other.venodorLocation == venodorLocation &&
        other.verifciationFee == verifciationFee &&
        other.verificationStatus == verificationStatus &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return vendorName.hashCode ^
        phoneNumber.hashCode ^
        venodorLocation.hashCode ^
        verifciationFee.hashCode ^
        verificationStatus.hashCode ^
        images.hashCode;
  }
}
