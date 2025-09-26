import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/modules/layout/details/domin/entities/movie_suggestions_entity.dart';
import 'package:movies_app/modules/layout/details/domin/use_cases/fetch_movie_suggestion.dart';
part 'movie_suggestions_event.dart';
part 'movie_suggestions_state.dart';

class MovieSuggestionsBloc
    extends Bloc<MovieSuggestionsEvent, MovieSuggestionsState> {
  final FetchMovieSuggestionUseCase fetchMovieSuggestionUseCase;

  MovieSuggestionsBloc(this.fetchMovieSuggestionUseCase)
    : super(MovieSuggestionsInitial()) {
    on<FetchMovieSuggestionsEvent>(fetchMoviesSuggestions);
  }

  FutureOr<void> fetchMoviesSuggestions(
    FetchMovieSuggestionsEvent event,
    Emitter<MovieSuggestionsState> emit,
  ) async {
    emit(MovieSuggestionsLoading());
    var response = await fetchMovieSuggestionUseCase.call(
      event.endPont,
      event.movieId,
    );
    response.fold(
      (failuer) {
        emit(MovieSuggestionsFaulier(failuer.errMessage));
      },
      (details) {
        emit(MovieSuggestionsSuccess(details));
      },
    );
  }
}
