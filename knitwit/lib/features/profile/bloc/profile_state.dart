part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoadedState extends ProfileState {
  const ProfileLoadedState({
    required this.user
  });
  final User user;

  @override
  List<Object> get props => super.props..add(user);
}

final class ProfileFailure extends ProfileState {
  const ProfileFailure({
      required this.error
    });
  final Object? error;

  @override
  List<Object> get props => super.props..add(error!);
}

