part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class FetchNotesEvent extends NoteEvent {}

class ClearNotesEvent extends NoteEvent {}

class DeleteNoteEvent extends NoteEvent {
  const DeleteNoteEvent({
    required this.id,
    required this.note,
  });

  final int id;
  final Note note;
  @override
  List<Object> get props => [
        id,
        note,
      ];
}
