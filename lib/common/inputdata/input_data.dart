import 'package:bai_serve_customer/utils/constants/app_images.dart';

class InputData {
  static Map<String, String> paymentList = {
    'mapesa': AppImages.mapesa,
    'tegopesa': AppImages.tegopesa,
    'airtel': AppImages.airtel,
    'holapesa': AppImages.holapesa,
    'selcom': AppImages.selcom,
    'zantel': AppImages.zantel,
  };

  static List<String> serviceTimes = [
    '10:00 AM',
    '10:15 AM',
    '10:30 AM',
    '10:45 AM',
    '11:00 AM',
    '11:15 AM',
    '11:30 AM',
    '11:45 AM',
    '12:00 PM',
  ];
}
