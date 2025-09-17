import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class FetchMovieDetailsEvent extends MovieDetailsEvent {
  final String endPont;
  final String movieId;

  const FetchMovieDetailsEvent({required this.endPont, required this.movieId});

  @override
  List<Object> get props => [endPont, movieId];
}
