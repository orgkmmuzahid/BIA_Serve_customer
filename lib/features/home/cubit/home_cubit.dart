import 'dart:async';

import 'package:bai_serve_customer/config/bloc/safe_cubit.dart';
import 'package:bai_serve_customer/config/dependency/dependency_injection.dart';
import 'package:bai_serve_customer/features/home/repository/home_repository.dart';

import 'home_state.dart';

class HomeCubit extends SafeCubit<HomeStates> {
  HomeCubit() : super(const HomeStates(banners: []));

  final HomeRepository _repository = getIt();

  Timer? _timer;

  void _startTimer() {
    if (state.banners.isEmpty == true) {
      return;
    }
    Timer.periodic(const Duration(seconds: 3), (timer) {
      _timer = timer;

      if (state.currentBannerIndex < (state.banners.length) - 1) {
        emit(state.copyWith(currentBannerIndex: state.currentBannerIndex + 1));
      } else {
        emit(state.copyWith(currentBannerIndex: 0));
      }
    });
  }

  void fetchBannerUrls() async {
    _timer?.cancel();
    final responce = await _repository.bannerUrls();
    if (responce.statusCode == 200) {
      emit(HomeStates(banners: responce.data));
      _startTimer();
    } else
      _timer?.cancel();
  }

  void onNavigatinChange(int currentNavigatonPage) {
    emit(state.copyWith(currentNavigatonPage: currentNavigatonPage));
  }
}
