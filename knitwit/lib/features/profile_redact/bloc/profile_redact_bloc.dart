import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:knitwit/api/api.dart';

part 'profile_redact_event.dart';
part 'profile_redact_state.dart';

class ProfileRedactBloc extends Bloc<ProfileRedactEvent, ProfileRedactState> {
  ProfileRedactBloc({
    required FlutterSecureStorage storage,
    required UsersApiClient usersApiClient
  }) :  _storage = storage,
        _usersApiClient = usersApiClient,
        super(ProfileRedactInitialState()) {
      on<ProfileRedactLoadEvent>(_onLoad);
      on<ChangeAvatarEvent>(_handleChangeAvatar);
      on<ChangeNicknameEvent>(_handleChangeNickname);
      on<ChangeEmailEvent>(_handleChangeEmail);
      on<ResetPasswordEvent>(_handleResetPassword);
  }

  final UsersApiClient _usersApiClient;
  final FlutterSecureStorage _storage;

  Future<void> _onLoad(
    ProfileRedactLoadEvent event,
    Emitter<ProfileRedactState> emit,
  ) async {
    try {
      emit(ProfileRedactLoadingState());
      final accessToken = await _storage.read(key: 'token');

      if (accessToken != null && accessToken.isNotEmpty) {
        final user = await _usersApiClient.authProfile();
        emit(ProfileRedactLoadedState(user: user));
      } else {
        emit(const ProfileRedactFailureState(error: 'Access Token is empty or null (ProfileRedactBloc)'));
      }
    } catch (error) {
      emit(ProfileRedactFailureState(error: error.toString()));
    }
  }

  Future<void> _handleChangeAvatar(
    ChangeAvatarEvent event,
    Emitter<ProfileRedactState> emit,
  ) async {
    try {
      emit(ProfileRedactLoadingState());
      await _usersApiClient.uploadAvatar(event.avatar);
      final user = await _usersApiClient.authProfile();
      emit(ProfileRedactLoadedState(user: user));
    } catch (error) {
      emit(ProfileRedactFailureState(error: error.toString()));
    }
  }

  Future<void> _handleChangeNickname(
    ChangeNicknameEvent event,
    Emitter<ProfileRedactState> emit,
  ) async {
    try {
      emit(ProfileRedactLoadingState());
      await _usersApiClient.changeNickname(event.newNickname);
      final user = await _usersApiClient.authProfile();
      emit(ProfileRedactLoadedState(user: user));
    } catch (error) {
      emit(ProfileRedactFailureState(error: error.toString()));
    }
  }

  Future<void> _handleChangeEmail(
    ChangeEmailEvent event,
    Emitter<ProfileRedactState> emit,
  ) async {
    try {
      emit(ProfileRedactLoadingState());
      await _usersApiClient.changeEmail(event.newEmail);
      final user = await _usersApiClient.authProfile();
      emit(ProfileRedactLoadedState(user: user));
    } catch (error) {
      emit(ProfileRedactFailureState(error: error.toString()));
    }
  }

  Future<void> _handleResetPassword(
    ResetPasswordEvent event,
    Emitter<ProfileRedactState> emit,
  ) async {
    try {
      emit(ProfileRedactLoadingState());
      await _usersApiClient.changePassword(event.newPassword);
      final user = await _usersApiClient.authProfile();
      emit(ProfileRedactLoadedState(user: user));
    } catch (error) {
      emit(ProfileRedactFailureState(error: error.toString()));
    }
  }
}