part of 'joke_bloc.dart';

@immutable
abstract class JokeState extends Equatable {
  @override
  List<Object> get props => [];
}

class JokeInitial extends JokeState {}

class JokeLoad extends JokeState {}

class JokeLoaded extends JokeState {
  final Joke joke;

  JokeLoaded({required this.joke});
}

class JokeLoadedWithError extends JokeState {
  final String message;

  JokeLoadedWithError({required this.message});
}
