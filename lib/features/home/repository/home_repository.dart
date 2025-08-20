import 'package:bai_serve_customer/config/network/dio_service.dart';
import 'package:bai_serve_customer/config/network/response_state.dart';

abstract class HomeRepository {
  Future<ResponseState<List<String>>> bannerUrls();
}
