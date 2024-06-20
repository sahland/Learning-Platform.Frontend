part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class ProfileLoadEvent extends ProfileEvent {
  const ProfileLoadEvent({
    this.completer
  });
  final Completer? completer;

  @override
  List<Object?> get props => super.props..add(completer);
}