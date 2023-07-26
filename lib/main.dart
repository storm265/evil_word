import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:evil_word/data/data_source/joke_data_source_impl.dart';
import 'package:evil_word/data/repository/joke_repository_impl.dart';
import 'package:evil_word/presentation/home_page/state/joke_bloc/joke_bloc.dart';
import 'package:evil_word/presentation/home_page/state/network_connection_cubit/internet_cubit.dart';
import 'package:evil_word/presentation/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => JokeBloc(
            jokeRepository: JokeRepositoryImpl(
              jokeDataSource: JokeDataSourceImpl(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => InternetCubit(
            connectivity: Connectivity(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '🤬 Evil word',
        theme: ThemeData(
          useMaterial3: true,
          textTheme: TextTheme(
            titleLarge: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorSchemeSeed: Colors.red,
        ),
        home: const HomePage(),
      ),
    );
  }
}
