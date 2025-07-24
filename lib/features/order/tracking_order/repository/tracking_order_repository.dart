// File: tracking_order_repository.dart

import 'package:bai_serve/config/network/dio_service.dart';
import 'package:bai_serve/features/order/tracking_order/model/tracking_order_model.dart';

abstract class TrackingOrderRepository {
  Future<void> trackingDetails({required String trackingId, required OnRequestStateChange<TrackingOrderModel> onStateChange});
}
