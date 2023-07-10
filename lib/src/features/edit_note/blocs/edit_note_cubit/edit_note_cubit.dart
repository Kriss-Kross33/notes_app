import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:formz_input/formz_input.dart';
import 'package:notes_app/src/common/common.dart';
import 'package:notes_app/src/features/home/home.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit({
    required NoteRepository noteRepository,
    required NoteBloc noteCubit,
  })  : _noteRepository = noteRepository,
        _noteCubit = noteCubit,
        super(const EditNoteState()) {
    _notesSubsciption = noteRepository.listenNotes().listen((newNotes) async {
      await _noteRepository.syncNotes();
    });
  }

  late StreamSubscription<List<Note>> _notesSubsciption;

  @override
  Future<void> close() async {
    await _notesSubsciption.cancel();
    await super.close();
  }

  final NoteRepository _noteRepository;
  final NoteBloc _noteCubit;

  void onTitleInput(String titleString) {
    emit(state.copyWith(status: EditNotesStatus.initial));
    final title = Field.dirty(titleString);
    emit(
      state.copyWith(
        title: title,
        status: EditNotesStatus.editied,
        note: Note(
          id: 0,
          title: title.value,
          body: '',
          created: null,
        ),
        isValid: Formz.validate(
          [
            title,
            state.body,
          ],
        ),
      ),
    );
  }

  void onBodyInput(String bodyString) {
    emit(state.copyWith(status: EditNotesStatus.initial));
    final body = Field.dirty(bodyString);
    emit(
      state.copyWith(
        body: body,
        status: EditNotesStatus.editied,
        note: Note(
          id: 0,
          title: '',
          body: body.value,
          created: null,
        ),
        isValid: Formz.validate(
          [
            state.title,
            body,
          ],
        ),
      ),
    );
  }

  Future<void> onSaveNoteButtonPressed(Note? note) async {
    emit(state.copyWith(status: EditNotesStatus.loading));
    late Note newNote;
    if (note == null) {
      newNote = Note(
        id: UniqueKey().hashCode,
        title: state.title.value,
        body: state.body.value,
        created: DateTime.now(),
      );
    } else {
      newNote = note.copyWith(
        title: state.title.value,
        body: state.body.value,
        created: note.created,
        updated: DateTime.now(),
      );
    }

    final eitherFailureOrSuccess = await _noteRepository.updateNote(
      note: newNote,
    );
    eitherFailureOrSuccess.fold((failure) {
      emit(
        state.copyWith(
          status: EditNotesStatus.failure,
          errorMessage: failure.errorMessage,
        ),
      );
    }, (success) {
      emit(
        state.copyWith(
          status: EditNotesStatus.success,
        ),
      );
      _noteCubit.add(FetchNotesEvent());
    });
  }
}
