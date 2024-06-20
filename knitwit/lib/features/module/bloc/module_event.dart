part of 'module_bloc.dart';

sealed class ModuleEvent extends Equatable{
  const ModuleEvent();

  @override
  List<Object?> get props => [];
}

class FetchSectionByIdEvent extends ModuleEvent {
  final int courseId;
  final int sectionId;
  final Completer<void>? completer;

  const FetchSectionByIdEvent({
    required this.courseId,
    required this.sectionId,
    this.completer,
  });
}


