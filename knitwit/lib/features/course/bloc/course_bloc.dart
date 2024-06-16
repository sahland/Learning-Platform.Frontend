import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:knitwit/api/api.dart';

part 'course_event.dart';
part 'course_state.dart';

// class CourseBloc extends Bloc<CourseEvent, CourseState> {
//   CourseBloc({required this.coursesApiClient}) : super(CourseInitial()) {
//     on<SearchCourses>(_onSearch);
//   }

//   Future<void> _onSearch(SearchCourses event, Emitter<CourseState> emit, ) async {
//     final courses = await coursesApiClient.getCoursesBySearch(event.keyword);
//   }

//   final CoursesApiClient coursesApiClient;
// }
