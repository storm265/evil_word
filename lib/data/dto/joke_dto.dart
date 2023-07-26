// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:evil_word/domain/entities/joke_entity.dart';

class JokeDTO {
  JokeDTO({
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'language': language,
      'insult': insult,
      'created': created,
      'shown': shown,
      'createdby': createdby,
      'active': active,
      'comment': comment,
    };
  }

  factory JokeDTO.fromJson(Map<String, dynamic> map) {
    return JokeDTO(
      number: map['number'],
      language: map['language'],
      insult: map['insult'],
      created: map['created'],
      shown: map['shown'],
      createdby: map['createdby'],
      active: map['active'],
      comment: map['comment'],
    );
  }

  JokeEntity toEntity() => JokeEntity(
        active: active,
        comment: comment,
        created: created,
        createdby: createdby,
        insult: insult,
        language: language,
        number: number,
        shown: shown,
      );
}
