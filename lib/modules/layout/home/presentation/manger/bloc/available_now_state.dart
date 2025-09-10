part of 'available_now_bloc.dart';

abstract class AvailableNowState extends Equatable {
  const AvailableNowState();

  @override
  List<Object> get props => [];
}

class AvailableNowInitial extends AvailableNowState {}

class AvailableNowLoding extends AvailableNowState {}

class AvailableNowSuccess extends AvailableNowState {
  final List<MovieEntity> myMovies;

  const AvailableNowSuccess(this.myMovies);
}

class AvailableNowFailuer extends AvailableNowState {
  final String msError;

  const AvailableNowFailuer(this.msError);
}
