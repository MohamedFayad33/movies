part of 'register_bloc.dart';

@immutable
abstract class RegisterState extends Equatable {}

class RegisterInitial extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterSuccess extends RegisterState {
  final bool isSuccess;

  RegisterSuccess(this.isSuccess);
  @override
  List<Object?> get props => [isSuccess];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterError extends RegisterState {
  final String msError;

  RegisterError(this.msError);
  @override
  List<Object?> get props => [msError];
}
