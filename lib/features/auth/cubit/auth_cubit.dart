import 'dart:async';

import 'package:bai_serve_customer/config/bloc/safe_cubit.dart';
import 'package:bai_serve_customer/config/dependency/dependency_injection.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/config/storage/storage_service.dart';
import 'package:bai_serve_customer/features/auth/model/sign_up_model.dart';
import 'package:bai_serve_customer/features/auth/model/user_login_info_model.dart';
import 'package:bai_serve_customer/features/auth/repository/auth_repository.dart';
import 'package:bai_serve_customer/main.dart';
import 'package:bai_serve_customer/utils/log/app_log.dart';
import 'package:flutter/material.dart';

import 'auth_state.dart';


class AuthCubit extends SafeCubit<AuthState> {
  AuthCubit() : super(const AuthState());
  final AuthRepository _repository = getIt();
  final StorageService _storageService = getIt();
  final String _loginInfo = 'login_info_key';

  Future<void> _saveUserInfo(UserLoginInfoModel userInfo) async {
    emit(state.copyWith(userLoginInfoModel: userInfo));
    _storageService.write(_loginInfo, userInfo.toJson());
  }

  Future<void> init() async {
    try {
      final String? data = await _storageService.read(_loginInfo);
      if (data != null) {
        _saveUserInfo(UserLoginInfoModel.fromJson(data));
      } else {
        emit(const AuthState());
      }
    } catch (e) {
      AppLogger.error(e.toString(), tag: 'Storage Service');
      AppLogger.error('Now Deleting everything from secure storage to resume, Restart The app', tag: 'Storage Service');
      _storageService.deleteAll();
    }
  }

  Future<void> signIn(String username, String password) async {
    if (state.isLoading) return;
    emit(const AuthState(isLoading: true));
    final responce = await _repository.signIn(username: username, password: password);
    emit(state.copyWith(isLoading: false));
    if (responce.statusCode == 200) {
      AppLogger.debug(responce.data.toString(), tag: 'AuthCubit');
      await _saveUserInfo(responce.data);
      appRouter.replaceAll([const HomeRoute()]);
    } else {
      showSnackBar(responce.message ?? '');
    }
  }

  Future<void> signUp(SignUpModel signUpModel) async {
    if (state.isLoading) return;
    emit(const AuthState(isLoading: true));
    final responce = await _repository.signUp(signUpModel: signUpModel);
    if (responce.statusCode == 200) {
      emit(const AuthState());
      signIn(signUpModel.username, signUpModel.password);
    } else {
      showSnackBar(responce.message ?? '');
    }
  }

  Future<void> signInWithGoogle() async {}

  Future<void> signInWithFacebook() async {}

  Future<void> getCurrentUser() async {
    final response = await _repository.getCurrentUser(username: state.userLoginInfoModel.username);
    if (response.data.accessToken.isNotEmpty) {
      await _saveUserInfo(response.data);
    } else {
      await _storageService.deleteAll();
      appRouter.replaceAll([const LoginOptionsRoute()]);
    }
  }

  Future<void> forgetPassword(String username, String otp) async {}

  Future<void> changePassword(String newPassword) async {
    appRouter.replace(
      SignInRoute(formKey: GlobalKey(), ctrUsername: TextEditingController(), ctrPassword: TextEditingController()),
    );
  }

  Future<void> updateToken({required String? accessToken, required String? refreshToken}) async {
    _saveUserInfo(state.userLoginInfoModel.copyWith(accessToken: accessToken, refreshToken: refreshToken));
  }

  Future<void> logout() async {
    await _repository.signOut();
    await _storageService.deleteAll();
    emit(const AuthState());
    appRouter.replaceAll([const LoginOptionsRoute()]);
  }
}
