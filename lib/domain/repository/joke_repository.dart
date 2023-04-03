import 'package:evil_word/domain/entities/joke_entity.dart';

abstract class JokeRepository {
  Future<JokeEntity> getJoke();
}
