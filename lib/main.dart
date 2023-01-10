import 'package:evil_word/data/data_source/joke_data_source_impl.dart';
import 'package:evil_word/data/repository/joke_repository_impl.dart';
import 'package:evil_word/logic/home_screen/bloc/joke_bloc/joke_bloc.dart';
import 'package:evil_word/presentation/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JokeBloc(
        jokeRepository: JokeRepositoryImpl(
          jokeDataSource: JokeDataSourceImpl(),
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '🤬 Evil word',
        theme: ThemeData(
          useMaterial3: true,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.red,
        ),
        home: HomePage(),
      ),
    );
  }
}
