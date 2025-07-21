import 'package:bai_serve/config/network/dio_service.dart';

abstract class HomeRepository {
  Future<void> bannerUrls({ required OnRequestStateChange<List<String>> onStateChange});
}