import 'package:bai_serve/features/auth/controllers/login_with_controller.dart';
import 'package:bai_serve/features/auth/controllers/otp_controller.dart';
import 'package:bai_serve/features/home/controller/home_controller.dart';
import 'package:get/get.dart';

import '../../features/auth/controllers/change_password_controller.dart';
import '../../features/auth/controllers/forget_password_controller.dart';
import '../../features/auth/controllers/sign_in_controller.dart';
import '../../features/auth/controllers/sign_up_controller.dart';
import '../../features/message/presentation/controller/chat_controller.dart';
import '../../features/message/presentation/controller/message_controller.dart';
import '../../features/notifications/presentation/controller/notifications_controller.dart';
import '../../features/profile/presentation/controller/profile_controller.dart';
import '../../features/setting/presentation/controller/privacy_policy_controller.dart';
import '../../features/setting/presentation/controller/setting_controller.dart';
import '../../features/setting/presentation/controller/terms_of_services_controller.dart';

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

    Get.lazyPut(() => NotificationsController(), fenix: true);
    Get.lazyPut(() => ChatController(), fenix: true);
    Get.lazyPut(() => MessageController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => SettingController(), fenix: true);
    Get.lazyPut(() => PrivacyPolicyController(), fenix: true);
    Get.lazyPut(() => TermsOfServicesController(), fenix: true);
  }
}
