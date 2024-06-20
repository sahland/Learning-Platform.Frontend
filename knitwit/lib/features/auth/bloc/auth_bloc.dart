import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:knitwit/api/api.dart';

part 'auth_event.dart';
part 'auth_state.dart';

bool isAuthorized = false;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required UsersApiClient usersApiClient,
    required AuthControllerApiClient authControllerApiClient,
    required FlutterSecureStorage storage,
  })  : _usersApiClient = usersApiClient,
        _authControllerApiClient = authControllerApiClient,
        _storage = storage,
        super(AuthInitialState()) {
    on<AuthLogoutEvent>(_logout);
    on<AuthCheckLoginInAppEvent>(_checkLoginInApp);
    on<AuthAuthorizeEvent>(_login);
    on<AuthRegisterEvent>(_register);
  }

  final UsersApiClient _usersApiClient;
  final AuthControllerApiClient _authControllerApiClient;
  final FlutterSecureStorage _storage;

  FutureOr<void> _login(
  AuthAuthorizeEvent event,
  Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthRequestState());
      final token = await _authControllerApiClient.auth(
        Auth(username: event.username, password: event.password),
      );
      await _storage.write(key: 'token', value: token.token);
      log('Token saved: ${token.token}');
      isAuthorized = true;
      emit(AuthAuthorizedState());
      event.completer?.complete();
    } catch (error) {
      if (error is DioException && error.response?.statusCode == 401) {
        emit(AuthFailedAuthorizedState(error: 'Unauthorized: Invalid credentials.'));
      } else {
        emit(AuthFailedAuthorizedState(error: error.toString()));
      }
      event.completer?.completeError(error);
    }
  }

  FutureOr<void> _logout(
    AuthLogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthUnAuthorizedState());
      await _storage.deleteAll();
      isAuthorized = false;
    } catch (error) {
      emit(AuthFailedAuthorizedState(error: error));
    }
  }

  FutureOr<void> _checkLoginInApp(
  AuthCheckLoginInAppEvent event,
  Emitter<AuthState> emit,
  ) async {
    try {
      bool exist = await _storage.containsKey(key: 'token');
      if (exist) {
        final token = await _storage.read(key: 'token');
        log('Token retrieved: $token');  // Логирование извлечения токена
        isAuthorized = true;
      }
      if (isAuthorized) {
        emit(AuthAuthorizedState());
      } else {
        emit(AuthUnAuthorizedState());
      }
    } catch (error) {
      emit(AuthFailedAuthorizedState(error: error));
    }
  }

  FutureOr<void> _register(
    AuthRegisterEvent event,
    Emitter<AuthState> emit
  ) async {
    try {
      await _authControllerApiClient.registration(
        event.username,
        event.email,
        event.password,
        event.confirmPassword
      );
    } catch (error) {
      emit(AuthFailedAuthorizedState(error: error));
    } finally {
      event.completer?.complete();
    }
  }
}
