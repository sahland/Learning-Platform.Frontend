import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_courses_event.dart';
part 'my_courses_state.dart';

class MyCoursesBloc extends Bloc<MyCoursesEvent, MyCoursesState> {
  MyCoursesBloc() : super(MyCoursesInitial()) {
    on<MyCoursesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}