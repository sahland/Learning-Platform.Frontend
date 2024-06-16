import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_redact_event.dart';
part 'profile_redact_state.dart';

class ProfileRedactBloc extends Bloc<ProfileRedactEvent, ProfileRedactState> {
  ProfileRedactBloc() : super(ProfileRedactInitial()) {
    on<ProfileRedactEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}