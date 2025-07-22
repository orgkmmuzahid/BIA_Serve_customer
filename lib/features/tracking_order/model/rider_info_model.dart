// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RiderInfoModel {
  final String id;
  final String name;
  final String phoneNumber;
  final double ratting;
  final int totalCount;
  final String bio;
  final String image;
  RiderInfoModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.ratting,
    required this.totalCount,
    required this.bio,
    required this.image,
  });

  RiderInfoModel copyWith({
    String? id,
    String? name,
    String? phoneNumber,
    double? ratting,
    int? totalCount,
    String? bio,
    String? image,
  }) {
    return RiderInfoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      ratting: ratting ?? this.ratting,
      totalCount: totalCount ?? this.totalCount,
      bio: bio ?? this.bio,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'ratting': ratting,
      'totalCount': totalCount,
      'bio': bio,
      'image': image,
    };
  }

  factory RiderInfoModel.fromMap(Map<String, dynamic> map) {
    return RiderInfoModel(
      id: map['id'] as String,
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      ratting: map['ratting'] as double,
      totalCount: map['totalCount'] as int,
      bio: map['bio'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RiderInfoModel.fromJson(String source) => RiderInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RiderInfoModel(id: $id, name: $name, phoneNumber: $phoneNumber, ratting: $ratting, totalCount: $totalCount, bio: $bio, image: $image)';
  }

  @override
  bool operator ==(covariant RiderInfoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.phoneNumber == phoneNumber &&
      other.ratting == ratting &&
      other.totalCount == totalCount &&
      other.bio == bio &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      phoneNumber.hashCode ^
      ratting.hashCode ^
      totalCount.hashCode ^
      bio.hashCode ^
      image.hashCode;
  }
}
