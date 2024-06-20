part of 'editor_bloc.dart';

@immutable
sealed class EditorEvent extends Equatable {
  const EditorEvent();

  @override
  List<Object?> get props => [];
}

class CreateCourseEvent extends EditorEvent {
  const CreateCourseEvent({
    required this.text,
    required this.file
  });
  final String text;
  final File file;

  @override
  List<Object?> get props => [text, file];
}

class ViewTagsEvent extends EditorEvent {
  const ViewTagsEvent({
    this.completer
  });
  final Completer<void>? completer;
}

class EditorInitEvent extends EditorEvent {
  const EditorInitEvent({
    this.completer
  });

  final Completer<void>? completer;

  @override
  List<Object?> get props => [completer];
}
