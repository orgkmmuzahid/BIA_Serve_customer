// File: payment_repository.dart

import 'package:bai_serve_customer/payment/model/payment_history_model.dart';

abstract class PaymentRepository {
  Future<List<PaymentHistoryModel>> paymentHistory();
}
