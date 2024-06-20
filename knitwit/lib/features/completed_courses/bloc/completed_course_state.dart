part of 'completed_course_bloc.dart';

@immutable
class CompletedCourseState extends Equatable {
  const CompletedCourseState();

  @override
  List<Object> get props => [];
}

class CompletedCourseInitialState extends CompletedCourseState {}

class CompletedCourseLoadingState extends CompletedCourseState {}

class CompletedCourseLoadedState extends CompletedCourseState {}

class CompletedCourseLoadingFailureState extends CompletedCourseState {}
