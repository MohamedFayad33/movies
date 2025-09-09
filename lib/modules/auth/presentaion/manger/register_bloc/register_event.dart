part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent extends Equatable {}

class RegisterUserEvent extends RegisterEvent {
  final String endPoint;
  final Map<String, dynamic> registerUser;

  RegisterUserEvent({required this.endPoint, required this.registerUser});

  @override
  List<Object?> get props => [endPoint, registerUser];
}
