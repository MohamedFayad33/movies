import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/modules/layout/details/domin/use_cases/fetch_movie_details.dart';
import 'package:movies_app/modules/layout/details/presentaion/manger/movie_details_event.dart';
import 'package:movies_app/modules/layout/details/presentaion/manger/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.fetchMovieDetailsUseCase)
    : super(MovieDetailsInitial()) {
    on<FetchMovieDetailsEvent>(fetchMovieDetails);
  }

  final FetchMovieDetailsUseCase fetchMovieDetailsUseCase;
  FutureOr<void> fetchMovieDetails(
    FetchMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    emit(MovieDetailsLoading());
    var response = await fetchMovieDetailsUseCase.call(
      event.endPont,
      event.movieId,
    );
    response.fold(
      (failuer) {
        print(failuer.errMessage);
        emit(MovieDetailsFaulier(failuer.errMessage));
      },
      (details) {
        print(details);
        emit(MovieDetailsSuccess(details));
      },
    );
  }
}
