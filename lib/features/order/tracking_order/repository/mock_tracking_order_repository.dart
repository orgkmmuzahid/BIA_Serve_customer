import 'package:bai_serve_customer/features/home/model/order_list_model.dart';
import 'package:bai_serve_customer/features/order/tracking_order/model/order_timeline_model.dart';
import 'package:bai_serve_customer/features/order/tracking_order/model/rider_info_model.dart';
import 'package:bai_serve_customer/features/order/tracking_order/model/tracking_order_model.dart';
import 'package:bai_serve_customer/features/order/tracking_order/repository/tracking_order_repository.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/utils/helpers/simulate_moc_repo.dart';

class MockTrackingOrderRepository implements TrackingOrderRepository {
  @override
  Future<TrackingOrderModel> trackingDetails({required String orderNumber}) async {
    await SimulateMocRepo();
    return TrackingOrderModel(
      trackingId: 'trackingId',
      senderName: 'senderName',
      phoneNumber: 'phoneNumber',
      reciverName: 'reciverName',
      reciverPhoneNumber: 'reciverPhoneNumber',
      address: 'address',
      status: DeliveryStatus.pending,
      estimatedDeliveryTime: const Duration(days: 1, hours: 12, minutes: 20),
      stepNumber: 2,
      riderInfo: RiderInfoModel(
        name: 'Cameron Williamson',
        phoneNumber: '+123456789',
        ratting: 4.5,
        totalCount: 35,
        bio:
            'Reliable and experienced local delivery driver with strong knowledge of city routes and a commitment to on-time service.',
        id: '',
        image: AppImages.callingBackground,
      ),
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
}
