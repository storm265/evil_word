import 'package:evil_word/data/model/joke_model.dart';

abstract class JokeRepository {
  Future<Joke> getJoke();
}
