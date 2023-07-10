part of 'edit_note_cubit.dart';

enum EditNotesStatus {
  initial,
  loading,
  success,
  failure,
  editied,
}

extension EditNotesStatusExt on EditNotesStatus {
  bool get isInitial => this == EditNotesStatus.initial;
  bool get isLoading => this == EditNotesStatus.loading;
  bool get isSuccess => this == EditNotesStatus.success;
  bool get isFailure => this == EditNotesStatus.failure;
  bool get isEdited => this == EditNotesStatus.editied;
}

class EditNoteState extends Equatable {
  const EditNoteState({
    this.status = EditNotesStatus.initial,
    this.note = Note.empty,
    this.errorMessage,
    this.title = const Field.pure(),
    this.body = const Field.pure(),
    this.isValid = false,
  });

  final EditNotesStatus status;

  final Field title;
  final Field body;

  final Note note;

  final String? errorMessage;
  final bool isValid;

  EditNoteState copyWith({
    EditNotesStatus? status,
    Note? note,
    String? errorMessage,
    Field? title,
    Field? body,
    bool? isValid,
  }) {
    return EditNoteState(
      status: status ?? this.status,
      note: note ?? this.note,
      title: title ?? this.title,
      body: body ?? this.body,
      errorMessage: errorMessage ?? this.errorMessage,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        status,
        note,
        errorMessage,
        title,
        body,
        isValid,
      ];
}
