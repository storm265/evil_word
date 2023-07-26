import 'package:evil_word/data/data_source/joke_data_source.dart';
import 'package:evil_word/domain/entities/joke_entity.dart';
import 'package:evil_word/domain/repository/joke_repository.dart';

class JokeRepositoryImpl extends JokeRepository {
  JokeRepositoryImpl({required JokeDataSource jokeDataSource})
      : _jokeDataSource = jokeDataSource;

  final JokeDataSource _jokeDataSource;

  @override
  Future<JokeEntity> fetchJoke() async {
    final rawJoke = await _jokeDataSource.fetchJoke();
    return rawJoke.toEntity();
  }
}
