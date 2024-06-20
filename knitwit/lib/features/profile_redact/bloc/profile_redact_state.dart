part of 'profile_redact_bloc.dart';

sealed class ProfileRedactState extends Equatable{
  const ProfileRedactState();

  @override
  List<Object> get props => [];
}

final class ProfileRedactInitialState extends ProfileRedactState {}

final class ProfileRedactLoadingState extends ProfileRedactState {}

final class ProfileRedactLoadedState extends ProfileRedactState {
  const ProfileRedactLoadedState({
    required this.user
  });
  final User user;

  @override
  List<Object> get props => super.props..add(user);
}

final class ProfileRedactFailureState extends ProfileRedactState {
  const ProfileRedactFailureState({
      required this.error
  });

  final Object? error;

  @override
  List<Object> get props => super.props..add(error!); 
}