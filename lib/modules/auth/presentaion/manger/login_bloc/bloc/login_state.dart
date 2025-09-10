part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  final bool isSuccess;

  LoginSuccess(this.isSuccess);
  @override
  List<Object?> get props => [isSuccess];
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginError extends LoginState {
  final String msError;

  LoginError(this.msError);
  @override
  List<Object?> get props => [msError];
}
