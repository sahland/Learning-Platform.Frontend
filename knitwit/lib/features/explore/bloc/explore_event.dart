part of 'explore_bloc.dart';

@immutable
sealed class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object?> get props => [];
}

class SearchCourses extends ExploreEvent {
  const SearchCourses({
    required this.keyword,
    this.completer
    });

  final String keyword;
  final Completer? completer;

  @override
  List<Object?> get props => super.props..addAll([keyword, completer]);
}

class ExploreAllCourses extends ExploreEvent {
  final Completer<void>? completer;
  const ExploreAllCourses({this.completer});
}

class ExploreTags extends ExploreEvent {
  final Completer<void>? completer;
  const ExploreTags({this.completer});
}

class ExploreInit extends ExploreEvent {
  final Completer<void>? completer;
  const ExploreInit({this.completer});
}
