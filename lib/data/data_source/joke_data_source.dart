import 'package:evil_word/data/dto/joke_dto.dart';

abstract class JokeDataSource {
  Future<JokeDTO> getJoke();
}
