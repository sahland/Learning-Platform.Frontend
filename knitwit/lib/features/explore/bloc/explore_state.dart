part of 'explore_bloc.dart';

sealed class ExploreState extends Equatable {
  const ExploreState();
  
  @override
  List<Object> get props => [];
}

final class ExploreInitial extends ExploreState {}

final class ExploreLoading extends ExploreState {}

final class ExploreLoaded extends ExploreState {
  const ExploreLoaded({
    required this.blocTags,
    required this.blocAllCourses,
  });

  final List<Tag> blocTags;
  final List<Course> blocAllCourses;

  @override
  List<Object> get props => [blocTags, blocAllCourses];
}


final class ExploreFailure extends ExploreState {
  const ExploreFailure(this.error);
  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}

