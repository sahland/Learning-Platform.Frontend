part of 'my_courses_bloc.dart';

sealed class MyCoursesState extends Equatable {
  const MyCoursesState();

  @override
  List<Object> get props => [];
}

final class MyCoursesInitialState extends MyCoursesState {}

final class MyCoursesLoadingState extends MyCoursesState {}

final class MyCoursesLoadedState extends MyCoursesState {
  const MyCoursesLoadedState({
    required this.blocMyCourses
  });

  final List<Course> blocMyCourses;

  @override
  List<Object> get props => super.props..add(blocMyCourses);
}

final class MyCoursesFailureState extends MyCoursesState {
  const MyCoursesFailureState(this.error);

  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}



