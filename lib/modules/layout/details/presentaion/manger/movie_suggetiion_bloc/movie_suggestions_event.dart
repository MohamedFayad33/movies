part of 'movie_suggestions_bloc.dart';

abstract class MovieSuggestionsEvent extends Equatable {
  const MovieSuggestionsEvent();

  @override
  List<Object> get props => [];
}

class FetchMovieSuggestionsEvent extends MovieSuggestionsEvent {
  final String endPont;
  final String movieId;

  const FetchMovieSuggestionsEvent({
    required this.endPont,
    required this.movieId,
  });

  @override
  List<Object> get props => [endPont, movieId];
}
