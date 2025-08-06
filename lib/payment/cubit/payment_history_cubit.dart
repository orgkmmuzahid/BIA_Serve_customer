import 'package:bai_serve_customer/config/dependency/dependency_injection.dart';
import 'package:bai_serve_customer/payment/repository/payment_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../model/payment_history_model.dart';

part 'payment_history_state.dart';

class PaymentHistoryCubit extends Cubit<PaymentHistoryState> {
  PaymentHistoryCubit() : super(const PaymentHistoryState());

  final PaymentRepository _repository = getIt();

  Future<void> fetch() async {
    emit(const PaymentHistoryState(isLoading: true));
    final response = await _repository.paymentHistory();
    emit(PaymentHistoryState(paymentHistory: response));
  }

  Future<void> loadMore() async {
    emit(state.copyWith(isLoading: true));
    final response = await _repository.paymentHistory();
    emit(state.copyWith(paymentHistory: [...state.paymentHistory ?? [], ...response], isLoading: false));
  }
}
