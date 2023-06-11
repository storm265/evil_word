import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evil_word/domain/entities/joke_entity.dart';
import 'package:evil_word/domain/repository/joke_repository.dart';
import 'package:meta/meta.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final JokeRepository jokeRepository;
  JokeBloc({required this.jokeRepository}) : super(JokeInitialState()) {
    on<JokeEvent>((event, emit) async {
      await _onLoadJokeEvent(event, emit);
    });
  }
  Future<void> _onLoadJokeEvent(
      JokeEvent event, Emitter<JokeState> emit) async {
    if (event is LoadJokesEvent) {
      emit(JokeLoadState());
      try {
        final joke = await _getJoke();
        emit(JokeLoadedState(joke: joke));
      } catch (e) {
        emit(JokeLoadedWithErrorState(message: e.toString()));
      }
    }
  }

  Future<JokeEntity> _getJoke() async => await jokeRepository.fetchJoke();
}
