import 'package:evil_word/data/data_source/joke_data_source.dart';
import 'package:evil_word/data/repository/joke_repository.dart';
import 'package:evil_word/data/model/joke_model.dart';

class JokeRepositoryImpl extends JokeRepository {
  final JokeDataSource _jokeDataSource;
  JokeRepositoryImpl({required JokeDataSource jokeDataSource})
      : _jokeDataSource = jokeDataSource;

  Future<Joke> getJoke() async {
    final responce = await _jokeDataSource.getJoke();
    return Joke.fromMap(responce);
  }
}
