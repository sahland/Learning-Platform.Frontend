part of 'course_bloc.dart';

@immutable
sealed class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object?> get props => [];
}

final class CourseInitialState extends CourseState {}

final class CourseLoadingState extends CourseState {}

final class CourseLoadedState extends CourseState {
  const CourseLoadedState({
    required this.course,
    this.isSubscribed = false,
  });

  final Course course;
  final bool isSubscribed;

  @override
  List<Object?> get props => [course, isSubscribed];
}

final class CourseSubscribedState extends CourseState {
  const CourseSubscribedState({
    required this.course,
  });

  final Course course;

  @override
  List<Object?> get props => [course];
}

final class CourseFailureState extends CourseState {
  const CourseFailureState(this.error);
  final Object error;

  @override
  List<Object?> get props => [error];
}
