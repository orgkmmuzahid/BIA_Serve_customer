import 'package:bai_serve/component/image/common_multiImage_picker_controller.dart';
import 'package:bai_serve/config/theme/theme_controller.dart';
import 'package:bai_serve/features/auth/controllers/login_with_controller.dart';
import 'package:bai_serve/features/auth/controllers/otp_controller.dart';
import 'package:bai_serve/features/chat/controllers/chat_controller.dart';
import 'package:bai_serve/features/custom_google_map/controllers/custom_google_map_controller.dart';
import 'package:bai_serve/features/home/controller/home_controller.dart';
import 'package:bai_serve/features/home/controller/home_order_conroller.dart';
import 'package:bai_serve/features/loyalty_points/controllers/loyalty_points_controller.dart';
import 'package:bai_serve/features/bulk_order/controllers/bulk_order_controller.dart';
import 'package:bai_serve/features/my_order/controllers/my_order_controller.dart';
import 'package:bai_serve/features/payment/controllers/payment_controller.dart';
import 'package:bai_serve/features/place_order/controllers/door_to_door_controller.dart';
import 'package:bai_serve/features/place_order/controllers/place_order_controller.dart';
import 'package:bai_serve/features/purchase_delivery/controllers/purchase_delivery_controller.dart';
import 'package:bai_serve/features/setting/controllers/setting_controller.dart';
import 'package:bai_serve/features/tracking_order/controllers/tracking_order_controller.dart';
import 'package:get/get.dart';

import '../../features/auth/controllers/change_password_controller.dart';
import '../../features/auth/controllers/forget_password_controller.dart';
import '../../features/auth/controllers/sign_in_controller.dart';
import '../../features/auth/controllers/sign_up_controller.dart';
import '../../features/notifications/presentation/controller/notifications_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut(() => ChangePasswordController(), fenix: true);
    Get.lazyPut(() => OtpController(), fenix: true);
    Get.lazyPut(() => LoginWithController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => HomeOrderConroller(), fenix: true);
    Get.lazyPut(() => ThemeController(), fenix: true);
    Get.lazyPut(() => DoorToDoorController(), fenix: true);
    Get.lazyPut(() => BulkOrderController(), fenix: true);

    Get.lazyPut(() => PlaceOrderController(), fenix: true);
    Get.lazyPut(() => LoyaltyPointsController(), fenix: true);
    Get.lazyPut(() => ChatController(), fenix: true);
     Get.lazyPut(() => PurchaseDeliveryController(), fenix: true);
     Get.lazyPut(() => MyOrderController(), fenix: true);
     Get.lazyPut(() => TrackingOrderController(), fenix: true);
     Get.lazyPut(() => SettingController(), fenix: true);
     Get.lazyPut(() => PaymentController(), fenix: true);
     
     //commponent
     Get.lazyPut(() => CommonMultiimagePickerController(), fenix: true);

    Get.lazyPut(() => NotificationsController(), fenix: true);
    Get.lazyPut(() => ChatController(), fenix: true);
    Get.lazyPut(() => CustomGoogleMapController(), fenix: true);
    
  }
}
