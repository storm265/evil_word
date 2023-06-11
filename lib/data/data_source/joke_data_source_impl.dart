import 'package:dio/dio.dart';
import 'package:evil_word/data/dto/joke_dto.dart';
import 'package:evil_word/data/data_source/joke_data_source.dart';

class JokeDataSourceImpl implements JokeDataSource {
  final _jokeUrl =
      'https://evilinsult.com/generate_insult.php?lang=en&type=json';
  final _dio = Dio();

  @override
  Future<JokeDTO> getJoke() async {
    try {
      final request = await _dio.get(_jokeUrl);
      final mapData = request.data as Map<String, dynamic>;
      return JokeDTO.fromJson(mapData);
    } catch (e) {
      throw 'Error!';
    }
  }
}
