import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@Collection(inheritance: false)
class NoteNode {
  Id? id;

  @TimestampConverter()
  DateTime? timeStamp;

  IsarLinks<Note> notes = IsarLinks<Note>();
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

@JsonSerializable(explicitToJson: true)
@Collection(inheritance: false)
class Note extends Equatable {
  ///
  const Note({
    required this.id,
    required this.title,
    required this.body,
    required this.created,
    this.updated,
  });
  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  final Id id;

  final String title;

  final String body;

  @TimestampConverter()
  final DateTime? created;
  @TimestampConverter()
  final DateTime? updated;

  static const empty = Note(
    title: '',
    body: '',
    id: 0,
    created: null,
  );

  Note copyWith({
    Id? id,
    String? title,
    String? body,
    DateTime? created,
    DateTime? updated,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  DateTime? dateTimeFromTimestamp(Timestamp? timestamp) {
    return timestamp?.toDate();
  }

  Map<String, dynamic> toJson() => _$NoteToJson(this);

  @override
  @ignore
  List<Object?> get props => [
        id,
        title,
        body,
        created,
        updated,
      ];
}
