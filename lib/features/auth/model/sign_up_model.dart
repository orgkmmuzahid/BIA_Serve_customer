// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignUpModel {
  final String verificationId;
  final String otp;
  final String username;
  final String password;
  SignUpModel({required this.verificationId, required this.otp, required this.username, required this.password});

  SignUpModel copyWith({String? verificationId, String? otp, String? username, String? password}) {
    return SignUpModel(
      verificationId: verificationId ?? this.verificationId,
      otp: otp ?? this.otp,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'verificationId': verificationId, 'otp': otp, 'username': username, 'password': password};
  }

  factory SignUpModel.fromMap(Map<String, dynamic> map) {
    return SignUpModel(
      verificationId: map['verificationId'] as String,
      otp: map['otp'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpModel.fromJson(String source) => SignUpModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignUpModel(verificationId: $verificationId, otp: $otp, username: $username, password: $password)';
  }

  @override
  bool operator ==(covariant SignUpModel other) {
    if (identical(this, other)) return true;

    return other.verificationId == verificationId &&
        other.otp == otp &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode {
    return verificationId.hashCode ^ otp.hashCode ^ username.hashCode ^ password.hashCode;
  }
}
