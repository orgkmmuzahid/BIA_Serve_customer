// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserLoginInfoModel {
 final String id;
 final String name;
 final String image;
 final String accessToken;
 final String refreshToken;
  UserLoginInfoModel({
    required this.id,
    required this.name,
    required this.image,
    required this.accessToken,
    required this.refreshToken,
  });

  UserLoginInfoModel copyWith({
    String? id,
    String? name,
    String? image,
    String? accessToken,
    String? refreshToken,
  }) {
    return UserLoginInfoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory UserLoginInfoModel.fromMap(Map<String, dynamic> map) {
    return UserLoginInfoModel(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      accessToken: map['accessToken'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLoginInfoModel.fromJson(String source) => UserLoginInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserLoginInfoModel(id: $id, name: $name, image: $image, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(covariant UserLoginInfoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.image == image &&
      other.accessToken == accessToken &&
      other.refreshToken == refreshToken;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      image.hashCode ^
      accessToken.hashCode ^
      refreshToken.hashCode;
  }
}
