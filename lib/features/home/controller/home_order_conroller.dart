import 'package:bai_serve/features/home/model/order_list_model.dart';
import 'package:bai_serve/utils/enum/enum.dart';
import 'package:get/get.dart';

class HomeOrderConroller extends GetxController {
    List<OrderListModel> orderList = [
    OrderListModel(orderNumber: 'BIA342178', orderPlacedDate: DateTime.now(), percelPickedUp: DateTime.now(), inTransition: DateTime.now(),
     orderProgress: OrderProgress.Pending, outForDelivery: 'In Progress'),
    OrderListModel(orderNumber: 'BIA342178', orderPlacedDate: DateTime.now(), percelPickedUp: DateTime.now(), inTransition: DateTime.now(),
     orderProgress: OrderProgress.Pending, outForDelivery: 'In Progress'),
  ];

  void fetchOrderList()async{
    orderList.add(OrderListModel(orderNumber: 'BIA342178', orderPlacedDate: DateTime.now(), percelPickedUp: DateTime.now(), inTransition: DateTime.now(),
     orderProgress: OrderProgress.Pending, outForDelivery: 'In Progress'),);

     update();
  }

}