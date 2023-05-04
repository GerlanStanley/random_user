import 'package:equatable/equatable.dart';

abstract class DeleteUserState extends Equatable {
  const DeleteUserState();
}

class InitialDeleteUserState extends DeleteUserState {
  @override
  List<Object> get props => [];
}

class LoadingDeleteUserState extends DeleteUserState {
  @override
  List<Object> get props => [];
}

class SuccessDeleteUserState extends DeleteUserState {
  @override
  List<Object> get props => [];
}

class FailureDeleteUserState extends DeleteUserState {
  final String error;

  const FailureDeleteUserState({required this.error});

  @override
  List<Object> get props => [error];
}
