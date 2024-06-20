part of 'profile_redact_bloc.dart';
sealed class ProfileRedactEvent extends Equatable{
  const ProfileRedactEvent();

  @override
  List<Object?> get props => [];
}

class ProfileRedactLoadEvent extends ProfileRedactEvent {
  const ProfileRedactLoadEvent({
    this.completer
  });
  final Completer? completer;

  @override
  List<Object?> get props => super.props..add(completer);
}

class ChangeAvatarEvent extends ProfileRedactEvent {
  final File avatar;
  ChangeAvatarEvent(this.avatar);
}

class ChangeNicknameEvent extends ProfileRedactEvent {
  const ChangeNicknameEvent({
    required this.newNickname
  });

  final String newNickname;

  @override
  List<Object?> get props => [newNickname];
}

class ChangeEmailEvent extends ProfileRedactEvent {
  const ChangeEmailEvent({
    required this.newEmail
  });

  final String newEmail;

  @override
  List<Object?> get props => [newEmail];
}

class ResetPasswordEvent extends ProfileRedactEvent {
  const ResetPasswordEvent({
    required this.newPassword
  });

  final String newPassword;

  @override
  List<Object?> get props => [newPassword];
}