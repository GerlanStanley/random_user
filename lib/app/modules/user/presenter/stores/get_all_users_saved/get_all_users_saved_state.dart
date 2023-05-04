import 'package:equatable/equatable.dart';

import '../../../domain/entities/user_entity.dart';

abstract class GetAllUsersSavedState extends Equatable {
  const GetAllUsersSavedState();
}

class InitialGetAllUsersSavedState extends GetAllUsersSavedState {
  @override
  List<Object> get props => [];
}

class LoadingGetAllUsersSavedState extends GetAllUsersSavedState {
  @override
  List<Object> get props => [];
}

class SuccessGetAllUsersSavedState extends GetAllUsersSavedState {
  final List<UserEntity> users;

  const SuccessGetAllUsersSavedState({
    required this.users,
  });

  @override
  List<Object> get props => [users];
}

class FailureGetAllUsersSavedState extends GetAllUsersSavedState {
  final String error;

  const FailureGetAllUsersSavedState({required this.error});

  @override
  List<Object> get props => [error];
}
