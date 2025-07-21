import 'package:bai_serve/config/network/dio_service.dart';
import 'package:bai_serve/config/network/request_state.dart';
import 'package:bai_serve/features/home/repository/home_repository.dart';

class MockHomeRepository implements HomeRepository {
  @override
  Future<void> bannerUrls({required OnRequestStateChange<List<String>> onStateChange}) async {
    onStateChange(RequestState(data: [
      'https://picsum.photos/seed/picsum/400/200',
      'https://picsum.photos/400/200?grayscale',
      'https://picsum.photos/id/237/400/200'
    ]));
  }
}
