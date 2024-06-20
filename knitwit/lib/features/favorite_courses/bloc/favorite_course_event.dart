part of 'favorite_course_bloc.dart';

@immutable
sealed class FavoriteCourseEvent extends Equatable{
  const FavoriteCourseEvent();

  @override
  List<Object?> get props => [];
}

final class SubscribedCoursesEvent extends FavoriteCourseEvent {
  const SubscribedCoursesEvent({this.completer});
  final Completer? completer;

  @override
  List<Object?> get props => super.props..add(completer);
}
