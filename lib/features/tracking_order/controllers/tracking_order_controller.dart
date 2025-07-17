// File: tracking_order_controller.dart

import 'package:bai_serve/features/home/model/order_list_model.dart';
import 'package:bai_serve/features/tracking_order/model/order_timeline_model.dart';
import 'package:bai_serve/features/tracking_order/model/tracking_order_model.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:get/get.dart';

// Get.lazyPut(() => TrackingOrderController(), fenix: true);

class TrackingOrderController extends GetxController {

  TrackingOrderModel trackingOrderModel = TrackingOrderModel(trackingId: 'trackingId',
   senderName: 'senderName',
   phoneNumber: 'phoneNumber',
    reciverName: 'reciverName',
     reciverPhoneNumber: 'reciverPhoneNumber', 
     address: 'address',
      status: DeliveryStatus.pending,
       estimatedDeliveryTime: Duration(days: 1, hours: 12, minutes: 20),
        stepNumber: 3,
         timeline: [
          OrderTimelineModel(time: DateTime.now(),
           isCleared: true,
            title: 'title',
             subtitle: 'subtitle')
         ], image: AppImages.appsIcon);
  
}