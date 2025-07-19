// File: tracking_order_controller.dart

import 'package:bai_serve/features/home/model/order_list_model.dart';
import 'package:bai_serve/features/tracking_order/model/order_timeline_model.dart';
import 'package:bai_serve/features/tracking_order/model/tracking_order_model.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:get/get.dart';

// Get.lazyPut(() => TrackingOrderController(), fenix: true);

class TrackingOrderController extends GetxController {
  TrackingOrderModel trackingOrderModel = TrackingOrderModel(
    trackingId: 'trackingId',
    senderName: 'senderName',
    phoneNumber: 'phoneNumber',
    reciverName: 'reciverName',
    reciverPhoneNumber: 'reciverPhoneNumber',
    address: 'address',
    status: DeliveryStatus.pending,
    estimatedDeliveryTime: const Duration(days: 1, hours: 12, minutes: 20),
    stepNumber: 2,
    timeline: [
      OrderTimelineModel(
        time: DateTime.now(),
        isCleared: true,
        title: 'Has Been Confirm Return Product',
        subtitle: 'Your order has been successfully placed! ',
      ),
      OrderTimelineModel(
        time: DateTime.now(),
        isCleared: true,
        title: 'Rider Received',
        subtitle: 'Pickup Assigned Head to the pickup location.',
      ),
      OrderTimelineModel(
        time: DateTime.now(),
        isCleared: false,
        title: 'Pickup',
        subtitle: 'Pickup Assigned Head to the pickup location.',
      ),
    ],
    image: AppImages.appsIcon,
  );
}
