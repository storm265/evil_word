
import 'package:evil_word/logic/home_screen/bloc/joke_bloc/joke_bloc.dart';
import 'package:evil_word/presentation/home_page/home_screen_decoration.dart';
import 'package:evil_word/presentation/home_page/widgets/erro_text_widget.dart';
import 'package:evil_word/presentation/home_page/widgets/loaded_joke_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async => context.read<JokeBloc>().add(LoadJokesEvent()),
      ),
      backgroundColor: HomeScreenDecoration.backgroundColor,
      appBar:
          HomeScreenDecoration.appBar(Theme.of(context).colorScheme.secondary),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BlocBuilder<JokeBloc, JokeState>(
              builder: (context, state) {
                if (state is JokeInitial) {
                  context.read<JokeBloc>().add(LoadJokesEvent());
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (state is JokeLoaded) {
                  return LoadedJokeWidget(joke: state.joke);
                } else if (state is JokeLoadedWithError) {
                  ErrorTextWidget(message: state.message);
                }
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
