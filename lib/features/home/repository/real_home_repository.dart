import 'package:bai_serve/config/network/dio_service.dart';
import 'package:bai_serve/features/home/repository/home_repository.dart';

class RealHomeRepository extends HomeRepository {
  @override
  Future<void> bannerUrls({required OnRequestStateChange<List<String>> onStateChange}) {
    // TODO: implement bannerUrls
    throw UnimplementedError();
  }
} 