import 'package:evil_word/presentation/home_page/state/joke_bloc/joke_bloc.dart';
import 'package:evil_word/presentation/home_page/widgets/error_text_widget.dart';
import 'package:evil_word/presentation/home_page/widgets/loaded_joke_widget.dart';
import 'package:evil_word/services/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state/network_connection_cubit/internet_cubit.dart';
import 'state/network_connection_cubit/internet_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocConsumer<InternetCubit, InternetCubitState>(
        listener: (context, state) {
          if (state is InternetDisconnectedState) {
            SnackbarService.showSnackbar(
              context: context,
              message: 'No internet',
            );
          }
        },
        builder: (context, state) {
          return FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: state is InternetConnectedState
                ? () => context.read<JokeBloc>().add(LoadJokesEvent())
                : null,
          );
        },
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
            child: BlocBuilder<JokeBloc, JokeState>(
              builder: (__, jokeState) {
                if (jokeState is JokeInitialState) {
                  context.read<JokeBloc>().add(LoadJokesEvent());
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (jokeState is JokeLoadedState) {
                  return LoadedJokeWidget(jokeEntity: jokeState.joke);
                }
                if (jokeState is JokeLoadedWithErrorState) {
                  return ErrorTextWidget(message: jokeState.message);
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
