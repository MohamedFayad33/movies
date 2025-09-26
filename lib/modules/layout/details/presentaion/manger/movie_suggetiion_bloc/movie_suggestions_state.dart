part of 'movie_suggestions_bloc.dart';

abstract class MovieSuggestionsState extends Equatable {
  const MovieSuggestionsState();

  @override
  List<Object> get props => [];
}

class MovieSuggestionsInitial extends MovieSuggestionsState {}

class MovieSuggestionsSuccess extends MovieSuggestionsState {
  final List<MovieSuggestionsEntity> myMovie;

  const MovieSuggestionsSuccess(this.myMovie);
  @override
  List<Object> get props => [myMovie];
}

class MovieSuggestionsLoading extends MovieSuggestionsState {}

class MovieSuggestionsFaulier extends MovieSuggestionsState {
  final String msErroe;

  const MovieSuggestionsFaulier(this.msErroe);
  @override
  List<Object> get props => [msErroe];
}
