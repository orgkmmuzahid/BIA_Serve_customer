// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  const AuthState({this.isLoading = false, this.errMessage = ''});

  final bool isLoading;
  final String errMessage;

  AuthState copyWith({bool? isLoading, String? errMessage}) {
    return AuthState(isLoading: isLoading ?? this.isLoading, errMessage: errMessage ?? this.errMessage);
  }

  @override
  List<Object> get props => [isLoading, errMessage];
}
