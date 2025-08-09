// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_tracking_cubit.dart';

class OrderTrackingState extends Equatable {
  const OrderTrackingState({this.isLoading = false, this.trackingModel});

  final bool isLoading;
  final TrackingOrderModel? trackingModel;

  OrderTrackingState copyWith({bool? isLoading, TrackingOrderModel? trackingModel}) {
    return OrderTrackingState(
      isLoading: isLoading ?? this.isLoading,
      trackingModel: trackingModel ?? this.trackingModel,
    );
  }

  @override
  List<Object?> get props => [isLoading, trackingModel];
}
