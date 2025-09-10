import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/modules/auth/domain/use_cases/register_use_case.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this.registerUseCase) : super(RegisterInitial()) {
    on<RegisterUserEvent>(registerUser);
  }

  final RegisterUseCase registerUseCase;

  FutureOr<void> registerUser(RegisterUserEvent event, emit) async {
    emit(RegisterLoading());
    try {
      var result = await registerUseCase.call(
        endPoint: event.endPoint,
        body: event.registerUser,
      );

      result.fold(
        (failuer) {
          emit(RegisterError(failuer.errMessage));
        },
        (success) {
          emit(RegisterSuccess(success));
        },
      );
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
}
