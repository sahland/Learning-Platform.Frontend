import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../api/api.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required FlutterSecureStorage storage,
    required UsersApiClient usersApiClient,
  }) : _storage = storage,
       _usersApiClient = usersApiClient,
       super(ProfileInitial()) {
    on<ProfileLoadEvent>(_onLoad);
  }

  final UsersApiClient _usersApiClient;
  final FlutterSecureStorage _storage;

  FutureOr<void> _onLoad(
    ProfileLoadEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(ProfileLoading());
      log('ProfileLoading state emitted');
      final accessToken = await _storage.read(key: 'token');
      log('Access Token: $accessToken');
      if (accessToken != null) {
        // Убедитесь, что токен не пустой
        if (accessToken.isNotEmpty) {
          final user = await _usersApiClient.authProfile();
          emit(ProfileLoadedState(user: user));
          log('ProfileLoadedState emitted with user: ${user.toJson()}');
        } else {
          log('Access Token is empty');
          emit(const ProfileFailure(error: 'Access Token is empty'));
        }
      } else {
        log('Access Token is null');
        emit(const ProfileFailure(error: 'Access Token is null'));
      }
    } catch (error) {
      log('Error occurred(Profile): $error');
      emit(ProfileFailure(error: error));
    }
  }
}

