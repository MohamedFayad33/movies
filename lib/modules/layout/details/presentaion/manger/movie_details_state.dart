import 'package:equatable/equatable.dart';
import 'package:movies_app/modules/layout/details/domin/entities/movie_details_entity.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetailsEntity myMovie;

  const MovieDetailsSuccess(this.myMovie);
  @override
  List<Object> get props => [myMovie];
}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsFaulier extends MovieDetailsState {
  final String msErroe;

  const MovieDetailsFaulier(this.msErroe);
  @override
  List<Object> get props => [msErroe];
}
