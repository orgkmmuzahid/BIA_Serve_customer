import 'package:bai_serve/config/network/dio_service.dart';
import 'package:bai_serve/features/home/repository/home_repository.dart';
import 'package:get/get.dart';

class RealHomeRepository extends HomeRepository {
  final DioService _dioService = Get.find();

  @override
  Future<void> bannerUrls({required OnRequestStateChange<List<String>> onStateChange}) {
    // TODO: implement bannerUrls
    throw UnimplementedError();
  }
} 