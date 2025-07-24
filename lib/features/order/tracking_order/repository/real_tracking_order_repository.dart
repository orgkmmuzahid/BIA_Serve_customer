import 'package:bai_serve/config/network/dio_service.dart';
import 'package:bai_serve/features/order/tracking_order/model/tracking_order_model.dart';
import 'package:bai_serve/features/order/tracking_order/repository/tracking_order_repository.dart';

class RealTrackingOrderRepository implements TrackingOrderRepository {
  @override
  Future<void> trackingDetails({required String trackingId, required OnRequestStateChange<TrackingOrderModel> onStateChange}) {
    // TODO: implement trackingDetails
    throw UnimplementedError();
  }
  
}