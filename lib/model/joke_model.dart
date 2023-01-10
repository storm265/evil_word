// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Joke {
  String? number;
  String? language;
  String? insult;
  String? created;
  String? shown;
  String? createdby;
  String? active;
  String? comment;

  Joke({
    this.number,
    this.language,
    this.insult,
    this.created,
    this.shown,
    this.createdby,
    this.active,
    this.comment,
  });

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

  factory Joke.fromMap(Map<String, dynamic> map) {
    return Joke(
      number: map['number'] != null ? map['number'] as String : null,
      language: map['language'] != null ? map['language'] as String : null,
      insult: map['insult'] != null ? map['insult'] as String : null,
      created: map['created'] != null ? map['created'] as String : null,
      shown: map['shown'] != null ? map['shown'] as String : null,
      createdby: map['createdby'] != null ? map['createdby'] as String : null,
      active: map['active'] != null ? map['active'] as String : null,
      comment: map['comment'] != null ? map['comment'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Joke.fromJson(String source) =>
      Joke.fromMap(json.decode(source) as Map<String, dynamic>);
}
