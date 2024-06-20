part of 'module_bloc.dart';

@immutable
sealed class ModuleState extends Equatable {
  const ModuleState();

  @override
  List<Object> get props => [];
}

final class ModuleInitialState extends ModuleState {}

final class ModuleLoadingState extends ModuleState {}

final class ModuleLoadedState extends ModuleState {
  final Section blocSection;

  const ModuleLoadedState({
    required this.blocSection
  });

  @override
  List<Object> get props => super.props..add(blocSection); 
}

final class ModuleFailureState extends ModuleState {
  const ModuleFailureState(this.error);

  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}