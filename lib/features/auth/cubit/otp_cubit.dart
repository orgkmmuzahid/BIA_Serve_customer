import 'dart:async';

import 'package:bai_serve_customer/config/bloc/safe_cubit.dart';
import 'package:bai_serve_customer/config/dependency/dependency_injection.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/features/auth/cubit/otp_state.dart';
import 'package:bai_serve_customer/features/auth/repository/auth_repository.dart';
import 'package:bai_serve_customer/main.dart';

class OtpCubit extends SafeCubit<OtpState> {
  OtpCubit() : super(const OtpState());
  final AuthRepository _repository = getIt();
  Timer? _timer;

  Future<void> resetState() async {
    emit(const OtpState());
  }

  Future<void> sendOtp(String username) async {
    if (_timer?.isActive == true || state.isLoading) {
      showSnackBar('${AppString.resendCodeIn} ${state.count} ${AppString.seconds}');
      return;
    }
    emit(OtpState(isLoading: true, username: username));
    final response = await _repository.sendOtp(username: username);
    if (response.data.isEmpty) {
      emit(const OtpState());
      return;
    }
    emit(state.copyWith(verificationId: response.data, isLoading: false));
    _startTimer();
  }

  Future<void> verifyOtp(String otp) async {
    if (state.isLoading || state.verificationId.isEmpty) return;
    final isVerified = await _repository.verifyOtp(verificationId: state.verificationId, otp: otp);
    emit(state.copyWith(isVerified: isVerified.data));
  }

  void _startTimer() {
    emit(state.copyWith(count: state.maxCount));
    _timer = null;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      emit(state.copyWith(count: state.count - 1));
      if (state.count == 0) {
        _timer?.cancel();
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
