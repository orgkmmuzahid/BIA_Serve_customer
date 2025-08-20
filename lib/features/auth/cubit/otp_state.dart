// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class OtpState extends Equatable {
  const OtpState({
    this.otp = '',
    this.count = 10,
    this.verificationId = '',
    this.isVerified = false,
    this.isLoading = false,
    this.username = '',
  });
  final String otp;
  final String verificationId;
  final bool isVerified;
  final String username;
  final maxCount = 10;
  final bool isLoading;
  final int count;

  OtpState copyWith({
    String? otp,
    String? verificationId,
    bool? isVerified,
    String? username,
    bool? isLoading,
    int? count,
  }) {
    return OtpState(
      otp: otp ?? this.otp,
      verificationId: verificationId ?? this.verificationId,
      isVerified: isVerified ?? this.isVerified,
      username: username ?? this.username,
      isLoading: isLoading ?? this.isLoading,
      count: count ?? this.count,
    );
  }

  @override
  List<Object> get props {
    return [otp, verificationId, isVerified, username, isLoading, count];
  }
}
