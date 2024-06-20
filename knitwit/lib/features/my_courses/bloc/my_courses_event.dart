part of 'my_courses_bloc.dart';

@immutable
sealed class MyCoursesEvent extends Equatable {
  const MyCoursesEvent();

  @override
  List<Object?> get props => [];
}

class GetUserCoursesEvent extends MyCoursesEvent {
  final int userId;
  final Completer? completer;

  const GetUserCoursesEvent({
    required this.userId,
    this.completer
  });

  @override
  List<Object?> get props => super.props..addAll([userId, completer]);
}

