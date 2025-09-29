import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/helper/failuer.dart';
import 'package:movies_app/modules/layout/home/domin/entities/movie.dart';
import 'package:movies_app/modules/layout/home/domin/use_cases/fetch_available_use_case.dart';

part 'available_now_event.dart';
part 'available_now_state.dart';

class AvailableNowBloc extends Bloc<AvailableNowEvent, AvailableNowState> {
  AvailableNowBloc(this.fetchAvailableUseCase) : super(AvailableNowInitial()) {
    on<FetchAvailableNowEvent>(fetchAvailableNowEvent);
  }
  final FetchAvailableUseCase fetchAvailableUseCase;
  List<MovieEntity> myMovies = [];

  FutureOr<void> fetchAvailableNowEvent(
    FetchAvailableNowEvent event,
    Emitter<AvailableNowState> emit,
  ) async {
    emit(AvailableNowLoding());
    try {
      Either<Failuer, List<MovieEntity>> myListMovies =
          await fetchAvailableUseCase.call();
      myListMovies.fold(
        (failuer) {
          emit(AvailableNowFailuer(failuer.toString()));
        },
        (succes) {
          myMovies = succes;
          emit(AvailableNowSuccess(succes));
        },
      );
    } catch (e) {
      emit(AvailableNowFailuer(e.toString()));
    }
  }
}
