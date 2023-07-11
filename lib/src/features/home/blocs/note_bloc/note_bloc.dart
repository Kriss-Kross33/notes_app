import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:errors/errors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz_input/formz_input.dart';
import 'package:notes_app/src/common/common.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc({required NoteRepository noteRepository})
      : _noteRepository = noteRepository,
        super(const NoteState()) {
    on<FetchNotesEvent>(_onFetchNoteEvent);
    on<DeleteNoteEvent>(_onDeleteNoteEvent);
    on<ClearNotesEvent>(_onClearNotesEvent);
    _notesSubsciption = noteRepository.listenNotes().listen((newNotes) {
      _noteRepository.syncNotes();
    });
  }

  final NoteRepository _noteRepository;
  late StreamSubscription<List<Note>> _notesSubsciption;

  List<Note> notes = [];

  @override
  Future<void> close() async {
    await _notesSubsciption.cancel();
    await super.close();
  }

  Future<void> _onFetchNoteEvent(
    FetchNotesEvent event,
    Emitter<NoteState> emit,
  ) async {
    await fetchNotes(emit);
  }

  Future<void> fetchNotes(Emitter<NoteState> emit) async {
    emit(state.copyWith(status: NotesStatus.loading));
    final eitherFailureOrNoteList = await _noteRepository.fetchAllNotes();
    eitherFailureOrNoteList.fold(
      (failure) => _mapFailureToState(failure, emit),
      (fetchedNotes) {
        fetchedNotes.sort((a, b) => b.created!.compareTo(a.created!));
        notes.addAll(fetchedNotes);
        emit(
          state.copyWith(
            notes: fetchedNotes,
            status: NotesStatus.success,
          ),
        );
      },
    );
  }

  void _mapFailureToState(Failure failure, Emitter<NoteState> emit) {
    if (failure is EmptyCacheFailure) {
      emit(
        state.copyWith(
          status: NotesStatus.empty,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: NotesStatus.failure,
        ),
      );
    }
  }

  Future<void> _onDeleteNoteEvent(
    DeleteNoteEvent event,
    Emitter<NoteState> emit,
  ) async {
    final eitherFailureOrNoteList = await _noteRepository.deleteNote(
      id: event.id,
      note: event.note,
    );
    eitherFailureOrNoteList.fold(
      (failure) => _mapFailureToState(failure, emit),
      (success) {
        emit(
          state.copyWith(
            status: NotesStatus.success,
          ),
        );
        add(FetchNotesEvent());
      },
    );
  }

  Future<void> _onClearNotesEvent(
    ClearNotesEvent event,
    Emitter<NoteState> emit,
  ) async {
    final eitherFailureOrNoteList = await _noteRepository.clearNotes();
    eitherFailureOrNoteList.fold(
      (failure) => _mapFailureToState(failure, emit),
      (success) async {
        emit(
          state.copyWith(
            status: NotesStatus.success,
          ),
        );
        await _noteRepository.syncFromCloudToLocalDb();
        add(FetchNotesEvent());
      },
    );
  }
}
