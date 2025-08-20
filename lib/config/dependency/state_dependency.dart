
import 'package:bai_serve_customer/features/bulk_order/controllers/bulk_order_controller.dart';
import 'package:bai_serve_customer/features/chat/controllers/chat_controller.dart';
import 'package:bai_serve_customer/features/custom_google_map/controllers/custom_google_map_controller.dart';
import 'package:bai_serve_customer/features/home/controller/home_controller.dart';
import 'package:bai_serve_customer/features/home/controller/home_order_conroller.dart';
import 'package:bai_serve_customer/features/loyalty_points/controllers/loyalty_points_controller.dart';
import 'package:bai_serve_customer/features/order/my_order/controllers/my_order_controller.dart';
import 'package:bai_serve_customer/features/order/place_order/controllers/door_to_door_controller.dart';
import 'package:bai_serve_customer/features/order/place_order/controllers/place_order_controller.dart';
import 'package:bai_serve_customer/features/purchase_delivery/controllers/purchase_delivery_controller.dart';
import 'package:bai_serve_customer/features/setting/controllers/setting_controller.dart';
import 'package:bai_serve_customer/features/vendor/features/vendor_sourcing/controllers/vendor_sourcing_controller.dart';
import 'package:bai_serve_customer/payment/controllers/payment_controller.dart';
import 'package:bai_serve_customer/utils/log/app_log.dart';
import 'package:get/get.dart';
import '../../features/notifications/controller/notifications_controller.dart';

class StateDependency {
  static void dependencies() {

    Get.lazyPut(HomeController.new, fenix: true);
    Get.lazyPut(HomeOrderConroller.new, fenix: true);
    Get.lazyPut(DoorToDoorController.new, fenix: true);
    Get.lazyPut(BulkOrderController.new, fenix: true);

    Get.lazyPut(PlaceOrderController.new, fenix: true);
    Get.lazyPut(LoyaltyPointsController.new, fenix: true);
    Get.lazyPut(ChatController.new, fenix: true);
    Get.lazyPut(PurchaseDeliveryController.new, fenix: true);
    Get.lazyPut(MyOrderController.new, fenix: true);
    Get.lazyPut(SettingController.new, fenix: true);
    Get.lazyPut(VendorSourcingController.new, fenix: true);
    //

    Get.lazyPut(NotificationsController.new, fenix: true);
    Get.lazyPut(ChatController.new, fenix: true);
    Get.lazyPut(CustomGoogleMapController.new, fenix: true);
    Get.lazyPut(PaymentController.new, fenix: true);

    AppLogger.debug('State dependency initalized', tag: 'dependency');
  }
}
