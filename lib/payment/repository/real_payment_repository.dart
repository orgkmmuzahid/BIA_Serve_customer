import 'package:bai_serve_customer/payment/model/payment_history_model.dart';
import 'package:bai_serve_customer/payment/repository/payment_repository.dart';

class RealPaymentRepository extends PaymentRepository {
  @override
  Future<List<PaymentHistoryModel>> paymentHistory() {
    // TODO: implement paymentHistory
    throw UnimplementedError();
  }
}
