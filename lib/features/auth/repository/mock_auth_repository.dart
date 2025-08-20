import 'package:bai_serve_customer/config/network/response_state.dart';
import 'package:bai_serve_customer/config/storage/user_login_info_model.dart';
import 'package:bai_serve_customer/features/auth/model/sign_up_model.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/utils/helpers/simulate_moc_repo.dart';

import 'auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  @override
  Future<ResponseState<UserLoginInfoModel>> signIn({required String username, required String password}) async =>
      ResponseState(
        data: UserLoginInfoModel(
          id: '',
          name: 'Km M Islam',
          image: AppImages.callingBackground,
          username: username,
          accessToken: 'bearer dddddd',
          refreshToken: 'beared ddddddds',
        ),
        statusCode: 200,
      );

  @override
  Future<String> signInWithFacebook() async => '';

  @override
  Future<String> signInWithGoogle() async => '';

  @override
  Future<ResponseState<String>> changePassword({
    required String username,
    required String oldPassword,
    required String newPassword,
  }) async => ResponseState(data: '', statusCode: 201);

  @override
  Future<ResponseState<bool>> deleteAccount() async => ResponseState(data: true, statusCode: 201);
  @override
  Future<ResponseState<UserLoginInfoModel>> getCurrentUser({required String username}) async => ResponseState(
    data: UserLoginInfoModel(
      id: '',
      name: 'Km M Islam',
      image: AppImages.callingBackground,
      username: username,
      accessToken: 'accessToken',
      refreshToken: 'refreshToken',
    ),
    statusCode: 200,
  );

  @override
  Future<ResponseState<bool>> resetPassword({
    required String username,
    required String verificationId,
    required String otp,
    required String newPassword,
  }) async => ResponseState(data: true, statusCode: 201);

  @override
  Future<ResponseState<String>> sendOtp({required String username}) async {
    await SimulateMocRepo();
    return ResponseState(data: '5555', statusCode: 201);
  }

  @override
  Future<ResponseState<bool>> signOut() async => ResponseState(data: true, statusCode: 201);

  @override
  Future<ResponseState<String>> signUp({required SignUpModel signUpModel}) async =>
      ResponseState(data: '', statusCode: 201);

  @override
  Future<ResponseState<bool>> verifyOtp({required String verificationId, required String otp}) async =>
      ResponseState(data: true, statusCode: 200);
}
