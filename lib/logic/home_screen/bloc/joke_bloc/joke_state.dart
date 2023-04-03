part of 'joke_bloc.dart';

@immutable
abstract class JokeState extends Equatable {
  @override
  List<Object> get props => [];
}

class JokeInitialState extends JokeState {}

class JokeLoadState extends JokeState {}

class JokeLoadedState extends JokeState {
  final JokeEntity joke;

  JokeLoadedState({required this.joke});
}

class JokeLoadedWithErrorState extends JokeState {
  final String message;

  JokeLoadedWithErrorState({required this.message});
}
