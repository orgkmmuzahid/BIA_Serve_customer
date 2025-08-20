import 'package:bai_serve_customer/config/network/dio_service.dart';
import 'package:bai_serve_customer/config/network/response_state.dart';
import 'package:bai_serve_customer/features/home/repository/home_repository.dart';
import 'package:get/get.dart';

class RealHomeRepository extends HomeRepository {
  final DioService _dioService = Get.find();

  @override
  Future<ResponseState<List<String>>> bannerUrls() {
    // TODO: implement bannerUrls
    throw UnimplementedError();
  }


} 
