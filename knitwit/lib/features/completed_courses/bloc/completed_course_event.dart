part of 'completed_course_bloc.dart';

@immutable
sealed class CompletedCourseEvent extends Equatable {
  const CompletedCourseEvent();

  @override
  List<Object> get props => [];
}

class CompletedCourseLoadEvent extends CompletedCourseEvent {}