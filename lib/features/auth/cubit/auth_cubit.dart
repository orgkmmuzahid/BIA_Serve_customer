import 'dart:async';

import 'package:bai_serve_customer/config/bloc/safe_cubit.dart';
import 'package:bai_serve_customer/config/dependency/dependency_injection.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/config/storage/storage_service.dart';
import 'package:bai_serve_customer/features/auth/model/sign_up_model.dart';
import 'package:bai_serve_customer/features/auth/repository/auth_repository.dart';
import 'package:bai_serve_customer/main.dart';
import 'package:flutter/material.dart';

import 'auth_state.dart';

class AuthCubit extends SafeCubit<AuthState> {
  AuthCubit() : super(const AuthState());
  final AuthRepository _repository = getIt();
  final StorageService _storageService = getIt();

  Future<void> signIn(String username, String password) async {
    if (state.isLoading) return;
    emit(const AuthState(isLoading: true));
    final responce = await _repository.signIn(username: username, password: password);
    emit(state.copyWith(isLoading: false));
    if (responce.statusCode == 200) {
      await _storageService.saveUserInfo(responce.data);
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
    final response = await _repository.getCurrentUser(username: _storageService.userLoginInfoModel.username);
    if (response.data.accessToken.isNotEmpty) {
      await _storageService.saveUserInfo(response.data);
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

  Future<void> logout() async {
    await _repository.signOut();
    await _storageService.deleteAll();
    appRouter.replaceAll([const LoginOptionsRoute()]);
  }
}
