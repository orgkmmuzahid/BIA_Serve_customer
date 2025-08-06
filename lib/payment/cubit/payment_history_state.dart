// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'payment_history_cubit.dart';

class PaymentHistoryState extends Equatable {
  const PaymentHistoryState({this.isLoading = false, this.paymentHistory});

  final bool isLoading;
  final List<PaymentHistoryModel>? paymentHistory;

  @override
  List<Object?> get props => [isLoading, paymentHistory];

  PaymentHistoryState copyWith({bool? isLoading, List<PaymentHistoryModel>? paymentHistory}) {
    return PaymentHistoryState(
      isLoading: isLoading ?? this.isLoading,
      paymentHistory: paymentHistory ?? this.paymentHistory,
    );
  }
}
