part of 'note_bloc.dart';

enum NotesStatus {
  initial,
  loading,
  success,
  failure,
  empty,
}

extension NotesStatusExt on NotesStatus {
  bool get isInitial => this == NotesStatus.initial;
  bool get isLoading => this == NotesStatus.loading;
  bool get isSuccess => this == NotesStatus.success;
  bool get isFailure => this == NotesStatus.failure;
  bool get isEmpty => this == NotesStatus.empty;
}

class NoteState extends Equatable {
  const NoteState({
    this.status = NotesStatus.initial,
    this.notes = const [],
    this.note = Note.empty,
    this.errorMessage,
  });

  final NotesStatus status;

  final List<Note> notes;
  final Note note;

  final String? errorMessage;

  NoteState copyWith({
    Note? note,
    NotesStatus? status,
    List<Note>? notes,
    String? errorMessage,
    Field? title,
    Field? body,
  }) {
    return NoteState(
      note: note ?? this.note,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        notes,
        errorMessage,
      ];
}
