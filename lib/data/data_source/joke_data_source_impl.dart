import 'package:dio/dio.dart';
import 'package:evil_word/data/data_source/joke_data_source.dart';

class JokeDataSourceImpl implements JokeDataSource {
  final _jokeUrl =
      'https://evilinsult.com/generate_insult.php?lang=en&type=json';
  final _dio = Dio();

  @override
  Future<Map<String, dynamic>> getJoke() async {
    final request = await _dio.get(_jokeUrl);
    if (request.statusCode == 200) {
      return request.data;
    } else {
      throw 'Something wrong';
    }
  }
}
