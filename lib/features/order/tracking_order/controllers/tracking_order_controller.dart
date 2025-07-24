// File: tracking_order_controller.dart
import 'package:bai_serve/config/network/request_state.dart';
import 'package:bai_serve/features/order/tracking_order/model/tracking_order_model.dart';
import 'package:bai_serve/features/order/tracking_order/repository/tracking_order_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Get.lazyPut(() => TrackingOrderController(), fenix: true);

class TrackingOrderController extends GetxController {
  final TrackingOrderRepository _trackingOrderRepository =  Get.find();
  TextEditingController searchController = TextEditingController();

  RequestState<TrackingOrderModel?> trackingOrderDetails = RequestState(data: null);

  void onOrderTrackingFetch()async{
    _trackingOrderRepository.trackingDetails(trackingId: searchController.text, onStateChange: (state){
      trackingOrderDetails = state;
       update();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    onOrderTrackingFetch();
    super.onInit();
  }


}
