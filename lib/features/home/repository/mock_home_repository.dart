
import 'package:bai_serve_customer/config/network/response_state.dart';
import 'package:bai_serve_customer/features/home/repository/home_repository.dart';
import 'package:bai_serve_customer/utils/helpers/simulate_moc_repo.dart';

class MockHomeRepository implements HomeRepository {
  @override
  Future<ResponseState<List<String>>> bannerUrls() async {
    await SimulateMocRepo();
    return ResponseState(
      data: [
      'https://picsum.photos/seed/picsum/400/200',
      'https://picsum.photos/400/200?grayscale',
      'https://picsum.photos/id/237/400/200'
      ],
      statusCode: 200,
    );
  }
}
