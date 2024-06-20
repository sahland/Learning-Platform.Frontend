part of 'course_bloc.dart';

@immutable
sealed class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object?> get props => [];
}

class FetchCourseByIdEvent extends CourseEvent {
  const FetchCourseByIdEvent({
    required this.courseId,
    this.completer,
  });

  final int courseId;
  final Completer<void>? completer;

  @override
  List<Object?> get props => [courseId, completer];
}

class SubscribeCourseEvent extends CourseEvent {
  const SubscribeCourseEvent({
    required this.courseId,
    this.completer,
  });

  final int courseId;
  final Completer<void>? completer;

  @override
  List<Object?> get props => [courseId, completer];
}
