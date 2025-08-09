import 'package:bai_serve_customer/config/bloc/safe_cubit.dart';
import 'package:bai_serve_customer/config/dependency/dependency_injection.dart';
import 'package:bai_serve_customer/features/order/tracking_order/model/tracking_order_model.dart';
import 'package:bai_serve_customer/features/order/tracking_order/repository/tracking_order_repository.dart';
import 'package:equatable/equatable.dart';

part 'order_tracking_state.dart';

class OrderTrackingCubit extends SafeCubit<OrderTrackingState> {
  OrderTrackingCubit() : super(const OrderTrackingState());
  final TrackingOrderRepository _repository = getIt();
  Future<void> fetch({required String orderId}) async {
    emit(const OrderTrackingState(isLoading: true));
    final response = await _repository.trackingDetails(orderNumber: orderId);
    emit(OrderTrackingState(trackingModel: response));
  }
}
