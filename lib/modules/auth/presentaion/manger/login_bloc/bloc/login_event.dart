part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {}

class LoginUserEvent extends LoginEvent {
  final String endPoint;
  final Map<String, dynamic> loginUser;

  LoginUserEvent({required this.endPoint, required this.loginUser});

  @override
  List<Object?> get props => [endPoint, loginUser];
}
