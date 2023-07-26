// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class JokeEntity extends Equatable {
  JokeEntity({
    required this.number,
    required this.language,
    required this.insult,
    required this.created,
    required this.shown,
    required this.createdby,
    required this.active,
    required this.comment,
  });

  final String number;

  final String language;

  final String insult;

  final String created;

  final String shown;

  final String createdby;

  final String active;

  final String comment;

  @override
  List<Object> get props => [
        number,
        language,
        insult,
        created,
        shown,
        createdby,
        active,
        comment,
      ];
}
