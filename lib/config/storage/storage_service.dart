
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class StorageService {

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

}
