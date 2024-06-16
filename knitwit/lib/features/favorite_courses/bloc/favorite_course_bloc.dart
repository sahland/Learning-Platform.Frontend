import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_course_event.dart';
part 'favorite_course_state.dart';

class FavoriteCourseBloc extends Bloc<FavoriteCourseEvent, FavoriteCourseState> {
  FavoriteCourseBloc() : super(FavoriteCourseInitial()) {
    on<FavoriteCourseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}