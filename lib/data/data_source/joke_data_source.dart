import 'package:evil_word/data/data_source/dto/joke_dto.dart';

abstract class JokeDataSource {
  Future<JokeDTO> getJoke();
}
