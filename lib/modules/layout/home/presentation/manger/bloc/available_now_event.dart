part of 'available_now_bloc.dart';

abstract class AvailableNowEvent extends Equatable {
  const AvailableNowEvent();

  @override
  List<Object> get props => [];
}

class FetchAvailableNowEvent extends AvailableNowEvent {}
