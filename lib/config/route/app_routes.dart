import 'package:bai_serve/features/auth/screen/forget_password_screen.dart';
import 'package:bai_serve/features/auth/screen/login_with_screen.dart';
import 'package:bai_serve/features/auth/screen/otp_send_screen.dart';
import 'package:bai_serve/features/home/screen/home_screen.dart';
import 'package:get/get.dart';
import '../../features/auth/screen/change_password_screen.dart';
import '../../features/auth/screen/sign_in_screen.dart';
import '../../features/auth/screen/sign_up_screen.dart';
import '../../features/auth/screen/verify_user_screen.dart';
import '../../features/message/presentation/screen/chat_screen.dart';
import '../../features/message/presentation/screen/message_screen.dart';
import '../../features/notifications/presentation/screen/notifications_screen.dart';
import '../../features/onboarding_screen/onboarding_screen.dart';
import '../../features/profile/presentation/screen/edit_profile.dart';
import '../../features/profile/presentation/screen/profile_screen.dart';
import '../../features/setting/presentation/screen/privacy_policy_screen.dart';
import '../../features/setting/presentation/screen/setting_screen.dart';
import '../../features/setting/presentation/screen/terms_of_services_screen.dart';
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

  //---------------------
  static const String changePassword = "/change_password_screen.dart";
  static const String notifications = "/notifications_screen.dart";
  static const String chat = "/chat_screen.dart";
  static const String message = "/message_screen.dart";
  static const String profile = "/profile_screen.dart";
  static const String editProfile = "/edit_profile.dart";
  static const String privacyPolicy = "/privacy_policy_screen.dart";
  static const String termsOfServices = "/terms_of_services_screen.dart";
  static const String setting = "/setting_screen.dart";

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

    //----------------------
    GetPage(name: changePassword, page: () => ChangePasswordScreen()),
    GetPage(name: notifications, page: () => const NotificationScreen()),
    GetPage(name: chat, page: () => const ChatListScreen()),
    GetPage(name: message, page: () => const MessageScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
    GetPage(name: editProfile, page: () => EditProfile()),
    GetPage(name: privacyPolicy, page: () => const PrivacyPolicyScreen()),
    GetPage(name: termsOfServices, page: () => const TermsOfServicesScreen()),
    GetPage(name: setting, page: () => const SettingScreen()),
  ];
}
