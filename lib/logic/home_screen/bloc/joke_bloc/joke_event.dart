part of 'joke_bloc.dart';

@immutable
abstract class JokeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadJokesEvent extends JokeEvent {}
