
import 'package:bai_serve_customer/config/storage/user_login_info_model.dart';
import 'package:bai_serve_customer/utils/log/app_log.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  late UserLoginInfoModel userLoginInfoModel;
  final String _loginInfo = 'login_info_key';
  late FlutterSecureStorage _storage;

  void _resetUserModel() async {
    userLoginInfoModel = UserLoginInfoModel(
      name: '',
      image: '',
      accessToken: '',
      refreshToken: '',
      id: '',
      username: '',
    );
  }

  Future<void> init() async {
    _storage = const FlutterSecureStorage();

    try {
      final String? data = await _storage.read(key: _loginInfo);
      if (data != null) {
        userLoginInfoModel = UserLoginInfoModel.fromJson(data);
      } else {
        _resetUserModel();
      }
    } catch (e) {
      AppLogger.error(e.toString(), tag: 'Storage Service');
      AppLogger.error('Now Deleting everything from secure storage to resume, Restart The app', tag: 'Storage Service');
      _storage.deleteAll();

    }
  }


  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> deleteAll() async {
    _resetUserModel();
    await _storage.deleteAll();
  }

  Future<void> saveUserInfo(UserLoginInfoModel userInfo) async {
    userLoginInfoModel = userInfo;
    _storage.write(key: _loginInfo, value: userInfo.toJson());
  }
}
