import 'package:equatable/equatable.dart';

abstract class SaveUserState extends Equatable {
  const SaveUserState();
}

class InitialSaveUserState extends SaveUserState {
  @override
  List<Object> get props => [];
}

class LoadingSaveUserState extends SaveUserState {
  @override
  List<Object> get props => [];
}

class SuccessSaveUserState extends SaveUserState {
  @override
  List<Object> get props => [];
}

class FailureSaveUserState extends SaveUserState {
  final String error;

  const FailureSaveUserState({required this.error});

  @override
  List<Object> get props => [error];
}
