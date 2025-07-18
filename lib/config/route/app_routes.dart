import 'package:bai_serve/features/auth/screen/profile_info_screen.dart';
import 'package:bai_serve/features/chat/screens/calling_screen.dart';
import 'package:bai_serve/features/chat/screens/message_screen.dart';
import 'package:bai_serve/features/payment/screens/my_payment_screen.dart';
import 'package:bai_serve/features/setting/screens/language_screen.dart';
import 'package:bai_serve/features/setting/screens/privacy_policy_screen.dart';
import 'package:bai_serve/features/setting/screens/setting_screen.dart';
import 'package:bai_serve/features/setting/screens/terms_condition_screen.dart';
import 'package:bai_serve/features/auth/screen/forget_password_screen.dart';
import 'package:bai_serve/features/auth/screen/login_with_screen.dart';
import 'package:bai_serve/features/auth/screen/otp_send_screen.dart';
import 'package:bai_serve/features/chat/screens/chat_screen.dart';
import 'package:bai_serve/features/home/screen/home_screen.dart';
import 'package:bai_serve/features/loyalty_points/screens/loyalty_points_screen.dart';
import 'package:bai_serve/features/loyalty_points/screens/my_rewards_screen.dart';
import 'package:bai_serve/features/bulk_order/screens/bulk_order_details_screen.dart';
import 'package:bai_serve/features/bulk_order/screens/bulk_order_screen.dart';
import 'package:bai_serve/features/my_order/screens/my_order_screen.dart';
import 'package:bai_serve/features/place_order/screens/checkout_screen.dart';
import 'package:bai_serve/features/place_order/screens/door_to_door_pickup_screen.dart';
import 'package:bai_serve/features/bulk_order/screens/negotiation_assistance_screen.dart';
import 'package:bai_serve/features/place_order/screens/order_details_screen.dart';
import 'package:bai_serve/features/payment/screens/payment_screen.dart';
import 'package:bai_serve/features/place_order/screens/pick_up_information_screen.dart';
import 'package:bai_serve/features/place_order/screens/place_order_screen.dart';
import 'package:bai_serve/features/purchase_delivery/screens/purchase_delivery_screen.dart';
import 'package:bai_serve/features/tracking_order/screens/tracking_order_screen.dart';
import 'package:bai_serve/features/vendor_sourcing/screens/all_product_screen.dart';
import 'package:bai_serve/features/vendor_sourcing/screens/all_vendors_screen.dart';
import 'package:bai_serve/features/vendor_sourcing/screens/view%20_product_screen.dart';
import 'package:bai_serve/features/vendor_sourcing/screens/vendor_sourcing_category_screen.dart';
import 'package:bai_serve/features/vendor_sourcing/screens/vendor_sourcing_screen.dart';
import 'package:get/get.dart';
import '../../features/auth/screen/change_password_screen.dart';
import '../../features/auth/screen/sign_in_screen.dart';
import '../../features/auth/screen/sign_up_screen.dart';
import '../../features/auth/screen/verify_user_screen.dart';
import '../../features/notifications/presentation/screen/notifications_screen.dart';
import '../../features/onboarding_screen/onboarding_screen.dart';
import '../../features/splash/splash_screen.dart';

class AppRoutes {
  static const String test = "/test_screen.dart";

  static const String splash = "/splash_screen.dart";
  static const String onboarding = "/onboarding_screen.dart";
  static const String signUp = "/sign_up_screen.dart";
  static const String verifyUser = "/verify_user_screen.dart";
  static const String signIn = "/sign_in_screen.dart";
  static const String forgotPassword = "/forget_password_screen.dart";
  static const String loginWith = "/login_with_screen.dart";
  static const String otpSend = "/otp_send_screen.dart";
  static const String home = "/home_screen.dart";
  static const String placeOrder = "/place_order_screen.dart";
  static const String pickupInformation = "/pick_up_information_screen.dart";
  static const String loyaltyPoints = "/loyalty_points_screen.dart";
  static const String myRewards = "/my_rewards_screen.dart";
  static const String orderDetails = "/order_details_screen.dart";
  static const String payment = "/payment_screen.dart";
  static const String checkout = "/checkout_screen.dart";
  static const String bulkOrder = "/bulk_order_screen.dart";
  static const String doorToDoorPickup = "/door_to_door_pickup_screen.dart";
  static const String negotiationAssistance = "/negotiation_assistance_screen.dart";
  static const String chat = "/chat_screen.dart";
  static const String bulkOrderDetails = "/bulk_order_details_screen.dart";
  static const String purchaseDelivery = "/purchase_delivery_screen.dart";
  static const String myOrder = "/my_order_screen.dart";
  static const String trackingOrder = "/tracking_order_screen.dart";
  static const String setting = "/setting_screen.dart";
  static const String language = "/language_screen.dart";
  static const String termsCondition = "/terms_condition_screen.dart";
  static const String privacyPolicy = "/privacy_policy_screen.dart";
  static const String profileInfo = "/profile_info_screen.dart";
  static const String myPayment = "/my_payment_screen.dart";
  static const String messageScreen = "/message_screen.dart";
  static const String calling = "/calling_screen.dart";
  static const String vendorSourcing = "/vendor_sourcing_screen.dart";
  static const String allProducts = "/all_product_screen.dart";
  static const String allVendors= "/all_vendors_screen.dart";
  static const String vendorSourcingCategory= "/vendor_sourcing_category_screen.dart";
  static const String viewProduct= "/view_product_screen.dart";
  

  //---------------------
  static const String changePassword = "/change_password_screen.dart";
  static const String notifications = "/notifications_screen.dart";
  static const String termsOfServices = "/terms_of_services_screen.dart";
  

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: loginWith, page: () => const LoginWithScreen()),
    GetPage(name: otpSend, page: () => const OtpSendScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: verifyUser, page: () => const VerifyUserScreen()),
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: forgotPassword, page: () => ForgetPasswordScreen()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: placeOrder, page: () => PlaceOrderScreen()),
    GetPage(name: pickupInformation, page: () => PickUpInformationScreen()),
    GetPage(name: loyaltyPoints, page: () => const LoyaltyPointsScreen()),
    GetPage(name: myRewards, page: () => const MyRewardsScreen()),
    GetPage(name: orderDetails, page: () => const OrderDetailsScreen()),
    GetPage(name: payment, page: () => const PaymentScreen()),
    GetPage(name: checkout, page: () => CheckoutScreen()),
    GetPage(name: bulkOrder, page: () => BulkOrderScreen()),
    GetPage(name: doorToDoorPickup, page: () => DoorToDoorPickupScreen()),
    GetPage(name: negotiationAssistance, page: () => NegotiationAssistanceScreen()),
    GetPage(name: chat, page: () =>  ChatScreen()),
    GetPage(name: bulkOrderDetails, page: () =>  BulkOrderDetailsScreen()),
    GetPage(name: purchaseDelivery, page: () => const PurchaseDeliveryScreen()),
    GetPage(name: myOrder, page: () => MyOrderScreen()),
    GetPage(name: trackingOrder, page: () => const TrackingOrderScreen()),
    GetPage(name: setting, page: () => const SettingScreen()),
    GetPage(name: language, page: () => const LanguageScreen()),
    GetPage(name: termsCondition, page: () => const TermsConditionScreen()),
    GetPage(name: privacyPolicy, page: () => const PrivacyPolicyScreen()),
    GetPage(name: profileInfo, page: () => const ProfileInfoScreen()),
    GetPage(name: myPayment, page: () => const MyPaymentScreen()),
    GetPage(name: messageScreen, page: () => const MessageScreen()),
    GetPage(name: calling, page: () => const CallingScreen()),
    GetPage(name: vendorSourcing, page: () => const VendorSourcingScreen()),
    GetPage(name: allProducts, page: () => const AllProductScreen()),
    GetPage(name: allVendors, page: () => const AllVendorsScreen()),
    GetPage(name: vendorSourcingCategory, page: () => const VendorSourcingCategoryScreen()),
    GetPage(name: viewProduct, page: () => const ViewProductScreen()),



    //----------------------
    GetPage(name: changePassword, page: () => ChangePasswordScreen()),
    GetPage(name: notifications, page: () => const NotificationScreen()),

  ];
}
