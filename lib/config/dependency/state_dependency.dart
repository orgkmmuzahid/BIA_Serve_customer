import 'package:bai_serve/config/theme/theme_controller.dart';
import 'package:bai_serve/features/auth/controllers/login_with_controller.dart';
import 'package:bai_serve/features/auth/controllers/otp_controller.dart';
import 'package:bai_serve/features/bulk_order/controllers/bulk_order_controller.dart';
import 'package:bai_serve/features/chat/controllers/chat_controller.dart';
import 'package:bai_serve/features/custom_google_map/controllers/custom_google_map_controller.dart';
import 'package:bai_serve/features/home/controller/home_controller.dart';
import 'package:bai_serve/features/home/controller/home_order_conroller.dart';
import 'package:bai_serve/features/loyalty_points/controllers/loyalty_points_controller.dart';
import 'package:bai_serve/features/my_order/controllers/my_order_controller.dart';
import 'package:bai_serve/features/payment/controllers/payment_controller.dart';
import 'package:bai_serve/features/place_order/controllers/door_to_door_controller.dart';
import 'package:bai_serve/features/place_order/controllers/place_order_controller.dart';
import 'package:bai_serve/features/purchase_delivery/controllers/purchase_delivery_controller.dart';
import 'package:bai_serve/features/setting/controllers/setting_controller.dart';
import 'package:bai_serve/features/tracking_order/controllers/tracking_order_controller.dart';
import 'package:bai_serve/features/vendor_sourcing/controllers/product_controller.dart';
import 'package:bai_serve/features/vendor_sourcing/controllers/vendor_sourcing_controller.dart';
import 'package:bai_serve/features/verify_vendor/controllers/verify_vendor_controller.dart';
import 'package:bai_serve/utils/log/app_log.dart';
import 'package:get/get.dart';

import '../../features/auth/controllers/change_password_controller.dart';
import '../../features/auth/controllers/forget_password_controller.dart';
import '../../features/auth/controllers/sign_in_controller.dart';
import '../../features/auth/controllers/sign_up_controller.dart';
import '../../features/notifications/presentation/controller/notifications_controller.dart';

class StateDependency {
  static void dependencies() {
    Get.lazyPut(SignUpController.new, fenix: true);
    Get.lazyPut(SignInController.new, fenix: true);
    Get.lazyPut(ForgetPasswordController.new, fenix: true);
    Get.lazyPut(ChangePasswordController.new, fenix: true);
    Get.lazyPut(OtpController.new, fenix: true);
    Get.lazyPut(LoginWithController.new, fenix: true);
    Get.lazyPut(HomeController.new, fenix: true);
    Get.lazyPut(HomeOrderConroller.new, fenix: true);
    Get.lazyPut(ThemeController.new, fenix: true);
    Get.lazyPut(DoorToDoorController.new, fenix: true);
    Get.lazyPut(BulkOrderController.new, fenix: true);

    Get.lazyPut(PlaceOrderController.new, fenix: true);
    Get.lazyPut(LoyaltyPointsController.new, fenix: true);
    Get.lazyPut(ChatController.new, fenix: true);
    Get.lazyPut(PurchaseDeliveryController.new, fenix: true);
    Get.lazyPut(MyOrderController.new, fenix: true);
    Get.lazyPut(TrackingOrderController.new, fenix: true);
    Get.lazyPut(SettingController.new, fenix: true);
    Get.lazyPut(PaymentController.new, fenix: true);
    Get.lazyPut(VendorSourcingController.new, fenix: true);
    Get.lazyPut(ProductController.new, fenix: true);
    Get.lazyPut(VerifyVendorController.new, fenix: true);

    
    //

    Get.lazyPut(NotificationsController.new, fenix: true);
    Get.lazyPut(ChatController.new, fenix: true);
    Get.lazyPut(CustomGoogleMapController.new, fenix: true);

     AppLogger.debug('State dependency initalized', tag: 'dependency');
  }
}