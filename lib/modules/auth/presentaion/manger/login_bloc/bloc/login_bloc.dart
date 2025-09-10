import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/modules/auth/domain/use_cases/login_use_case.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginUserEvent>(registerUser);
  }
  final LoginUseCase loginUseCase;

  FutureOr<void> registerUser(LoginUserEvent event, emit) async {
    emit(LoginLoading());
    try {
      var result = await loginUseCase.call(
        endPoint: event.endPoint,
        body: event.loginUser,
      );

      result.fold(
        (failuer) {
          emit(LoginError(failuer.errMessage));
        },
        (success) {
          emit(LoginSuccess(success));
        },
      );
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
