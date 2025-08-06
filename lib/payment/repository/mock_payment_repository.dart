import 'package:bai_serve_customer/payment/model/payment_history_model.dart';
import 'package:bai_serve_customer/payment/repository/payment_repository.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/utils/helpers/simulate_moc_repo.dart';

class MockPaymentRepository extends PaymentRepository {
  @override
  Future<List<PaymentHistoryModel>> paymentHistory() async {
    await SimulateMocRepo();
    return [
      for (int i = 0; i < 10; i++)
        PaymentHistoryModel(
          id: '1234569874522',
          image: AppImages.zantel,
          amount: 150,
          transactionType: i % 2 == 0 ? TransactionType.cashIn : TransactionType.CashOut,
          transactionTime: DateTime.now(),
        ),
    ];
  }
}
