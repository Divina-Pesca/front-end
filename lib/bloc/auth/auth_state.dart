import 'package:equatable/equatable.dart';

abstract class LogInState extends Equatable {}

class LoginInitial extends LogInState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginLoading extends LogInState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginFailed extends LogInState {
  final String error;
  LoginFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

// Only the LogInLoaded event needs to contain data
class LogInCompleted extends LogInState {
  final dynamic login;

  LogInCompleted(this.login);

  @override
  // TODO: implement props
  List<Object> get props => [login];
}
