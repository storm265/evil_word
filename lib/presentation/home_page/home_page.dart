import 'package:evil_word/logic/home_screen/bloc/joke_bloc/joke_bloc.dart';
import 'package:evil_word/logic/home_screen/bloc/network_connection/internet_cubit.dart';
import 'package:evil_word/logic/home_screen/bloc/network_connection/internet_state.dart';
import 'package:evil_word/presentation/home_page/widgets/error_text_widget.dart';
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        centerTitle: true,
        title: const Text(
          '🤬 Evil word',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BlocBuilder<InternetCubit, InternetCubitState>(
              builder: (_, connectionState) => connectionState
                      is InternetDisconnectedState
                  ? const Center(
                      child: Text(
                        'No internet',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : BlocBuilder<JokeBloc, JokeState>(
                      builder: (__, jokeState) {
                        if (jokeState is JokeInitialState) {
                          context.read<JokeBloc>().add(LoadJokesEvent());
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                        if (jokeState is JokeLoadedState) {
                          return LoadedJokeWidget(joke: jokeState.joke);
                        }
                        if (jokeState is JokeLoadedWithErrorState) {
                          return ErrorTextWidget(message: jokeState.message);
                        }

                        return const SizedBox();
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
