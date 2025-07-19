// File: my_order_controller.dart

import 'package:bai_serve/config/api/server_request.dart';
import 'package:bai_serve/features/home/model/order_list_model.dart';
import 'package:bai_serve/features/my_order/enum/order_filter_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Get.lazyPut(() => MyOrderController(), fenix: true);

class MyOrderController extends GetxController {
  TextEditingController searchController = TextEditingController();
  OrderFilterEnum orderFilterEnum = OrderFilterEnum.all;

  ServerRequest<List<OrderListModel>> orderList = ServerRequest(
    requestStatus: RequestStatus.init,
    data: [
      OrderListModel(
        orderNumber: 'BIA342178',
        orderPlacedDate: DateTime.now(),
        percelPickedUp: DateTime.now(),
        inTransition: DateTime.now(),
        deliveryStatus: DeliveryStatus.pending,
        outForDelivery: 'In Progress',
      ),
      OrderListModel(
        orderNumber: 'BIA342178',
        orderPlacedDate: DateTime.now(),
        percelPickedUp: DateTime.now(),
        inTransition: DateTime.now(),
        deliveryStatus: DeliveryStatus.cancel,
        outForDelivery: 'In Progress',
      ),
    ],
  );

  void onSearch() {}

  void onFilterOrderList(OrderFilterEnum filter) async {
    orderFilterEnum = filter;
    update();
    //dummy
    final List<OrderListModel> list = [
      ...orderList.data
              ?.map(
                (value) => value.copyWith(
                  deliveryStatus:
                      DeliveryStatus.values[filter.index < 3
                          ? filter.index
                          : 2],
                ),
              )
              .toList() ??
          [],
    ];
    orderList = orderList.copyWith(
      requestStatus: RequestStatus.requesting,
      data: [],
    );
    orderList = orderList.copyWith(
      requestStatus: RequestStatus.success,
      data: list,
    );
    update();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
