import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evil_word/data/repository/joke_repository.dart';
import 'package:evil_word/data/model/joke_model.dart';
import 'package:meta/meta.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final JokeRepository jokeRepository;
  JokeBloc({required this.jokeRepository}) : super(JokeInitial()) {
    on<JokeEvent>((event, emit) async {
      if (event is LoadJokesEvent) {
        emit(JokeLoad());
        try {
          final joke = await jokeRepository.getJoke();
          emit(JokeLoaded(joke: joke));
        } catch (e) {
          emit(JokeLoadedWithError(message: e.toString()));
        }
        final joke = await _getJoke();
        emit(JokeLoaded(joke: joke));
      }
    });
  }
  Future<Joke> _getJoke() async => await jokeRepository.getJoke();
}
