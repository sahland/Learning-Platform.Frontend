part of 'editor_bloc.dart';

sealed class EditorState extends Equatable {
  const EditorState();
  
  @override
  List<Object> get props => [];
}

final class EditorInitial extends EditorState {}

final class EditorLoading extends EditorState {}

final class EditorLoaded extends EditorState {
  const EditorLoaded({
    required this.blocCourse,
    required this.blocAllTags
  });

  final Course blocCourse;
  final List<Tag> blocAllTags;

  @override
  List<Object> get props => super.props..addAll([blocCourse, blocAllTags]);
}

final class EditorFailure extends EditorState {
  const EditorFailure(this.error);
  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}


