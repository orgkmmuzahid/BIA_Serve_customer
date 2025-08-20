// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum Role { RIDER, USER, ADMIN, SUPER_ADMIN, VENDOR, AGENT }

class UserLoginInfoModel {
  final String id;
  final String name;
  final String image;
  final String username;
  final String accessToken;
  final String refreshToken;
  //enum
  final Role? role;
  UserLoginInfoModel({
    required this.id,
    required this.name,
    required this.image,
    required this.username,
    required this.accessToken,
    required this.refreshToken,
    this.role,
  });


  UserLoginInfoModel copyWith({
    String? id,
    String? name,
    String? image,
    String? username,
    String? accessToken,
    String? refreshToken,
    Role? role,
  }) {
    return UserLoginInfoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      username: username ?? this.username,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'username': username,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'role': role?.index,
    };
  }

  factory UserLoginInfoModel.fromMap(Map<String, dynamic> map) {
    return UserLoginInfoModel(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      username: map['username'] as String,
      accessToken: map['accessToken'] as String,
      refreshToken: map['refreshToken'] as String,
      role: map['role'] != null ? Role?.values[map['role'] as int] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLoginInfoModel.fromJson(String source) => UserLoginInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserLoginInfoModel(id: $id, name: $name, image: $image, username: $username, accessToken: $accessToken, refreshToken: $refreshToken, role: $role)';
  }

  @override
  bool operator ==(covariant UserLoginInfoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.image == image &&
        other.username == username &&
      other.accessToken == accessToken &&
        other.refreshToken == refreshToken &&
        other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      image.hashCode ^
        username.hashCode ^
      accessToken.hashCode ^
        refreshToken.hashCode ^
        role.hashCode;
  }
}
