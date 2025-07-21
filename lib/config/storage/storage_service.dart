import 'package:bai_serve/config/storage/user_login_info_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class StorageService extends GetxService{
  late UserLoginInfoModel userLoginInfoModel;
  final String _loginInfo = 'login_info_key';

  Future<void> init () async{
    _storage = const FlutterSecureStorage();

   final String? data = await _storage.read(key: _loginInfo);
   if(data != null){
     userLoginInfoModel = UserLoginInfoModel.fromJson(data);
   }else{
     userLoginInfoModel = UserLoginInfoModel(name: '', image: '', accessToken: '', refreshToken: '', id: '');
   }

  }

  late FlutterSecureStorage _storage;

  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> deleteAll() async {
    userLoginInfoModel = UserLoginInfoModel(name: '', image: '', accessToken: '', refreshToken: '', id: '');
    await _storage.deleteAll();
  }

  Future<void> saveUserInfo(UserLoginInfoModel userInfo)async{
    userInfo = userInfo;
    _storage.write(key: _loginInfo, value: userInfo.toJson());
  }
}
