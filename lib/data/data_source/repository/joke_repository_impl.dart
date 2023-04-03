import 'package:evil_word/data/data_source/joke_data_source.dart';
import 'package:evil_word/domain/entities/joke_entity.dart';
import 'package:evil_word/domain/repository/joke_repository.dart';

class JokeRepositoryImpl extends JokeRepository {
  final JokeDataSource _jokeDataSource;
  JokeRepositoryImpl({required JokeDataSource jokeDataSource})
      : _jokeDataSource = jokeDataSource;

  Future<JokeEntity> getJoke() async {
    final rawJoke = await _jokeDataSource.getJoke();
    return rawJoke.toEntity();
  }
}
