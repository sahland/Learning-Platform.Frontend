import 'package:flutter_bloc/flutter_bloc.dart';

part 'module_event.dart';
part 'module_state.dart';

class ModuleBloc extends Bloc<ModuleEvent, ModuleState> {
  ModuleBloc() : super(ModuleInitial()) {
    on<ModuleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}