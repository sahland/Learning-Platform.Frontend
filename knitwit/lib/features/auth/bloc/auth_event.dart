part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthCheckLoginInAppEvent extends AuthEvent {}

class AuthLogoutEvent extends AuthEvent {}

class AuthAuthorizeEvent extends AuthEvent {
  const AuthAuthorizeEvent({
    this.completer,
    required this.username,
    required this.password
  });

  final String username;
  final String password;
  final Completer? completer;

  @override
  List<Object?> get props => super.props..addAll([completer, username, password]);
}

class AuthRegisterEvent extends AuthEvent {
  const AuthRegisterEvent({
    this.completer,
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  final Completer? completer;

  @override
  List<Object?> get props => super.props..addAll([username, email, password, confirmPassword, completer]);
}