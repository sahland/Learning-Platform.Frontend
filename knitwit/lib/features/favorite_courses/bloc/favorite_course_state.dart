part of 'favorite_course_bloc.dart';

sealed class FavoriteCourseState extends Equatable {
  const FavoriteCourseState();

  @override
  List<Object> get props => [];
}

final class FavoriteCourseInitialState extends FavoriteCourseState {}

final class FavoriteCourseLoadingState extends FavoriteCourseState {}

final class FavoriteCourseLoadedState extends FavoriteCourseState {
  const FavoriteCourseLoadedState({
    required this.subscribedCourses
  });

  final List<Course> subscribedCourses;

  @override
  List<Object> get props => super.props..add(subscribedCourses);
}

final class FavoriteCourseFailureState extends FavoriteCourseState {
  const FavoriteCourseFailureState(this.error);
  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}


