import 'package:equatable/equatable.dart';

import '../../../domain/entities/user_entity.dart';

abstract class GetRandomUserState extends Equatable {
  const GetRandomUserState();
}

class InitialGetRandomUserState extends GetRandomUserState {
  @override
  List<Object> get props => [];
}

class LoadingGetRandomUserState extends GetRandomUserState {
  @override
  List<Object> get props => [];
}

class SuccessGetRandomUserState extends GetRandomUserState {
  final UserEntity user;

  const SuccessGetRandomUserState({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

class FailureGetRandomUserState extends GetRandomUserState {
  final String error;

  const FailureGetRandomUserState({required this.error});

  @override
  List<Object> get props => [error];
}
