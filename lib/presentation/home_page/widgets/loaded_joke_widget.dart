import 'package:evil_word/data/model/joke_model.dart';
import 'package:flutter/material.dart';

class LoadedJokeWidget extends StatelessWidget {
  final Joke joke;
  const LoadedJokeWidget({
    Key? key,
    required this.joke,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 1,
        color: Colors.transparent,
        shadowColor: Theme.of(context).colorScheme.secondary,
        child: Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 3,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          child: Text(
            "${joke.insult}.",
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
