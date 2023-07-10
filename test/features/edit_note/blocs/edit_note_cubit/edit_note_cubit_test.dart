import 'package:errors/errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_app/src/common/common.dart';
import 'package:notes_app/src/features/edit_note/blocs/blocs.dart';
import 'package:notes_app/src/features/features.dart';

import 'edit_note_cubit_test.mocks.dart';

@GenerateMocks([NoteRepository, NoteBloc])
void main() {
  late EditNoteCubit editNoteCubit;
  late MockNoteBloc mockNoteBloc;
  late EditNoteState editNoteState;
  late MockNoteRepository mockNoteRepository;

  setUp(() {
    mockNoteRepository = MockNoteRepository();
    mockNoteBloc = MockNoteBloc();
    when(mockNoteRepository.listenNotes()).thenAnswer(
      (_) => const Stream.empty(),
    );
    editNoteCubit = EditNoteCubit(
      noteRepository: mockNoteRepository,
      noteCubit: mockNoteBloc,
    );
    editNoteState = const EditNoteState();
  });

  // tearDown(editNoteCubit.close);

  group(
    'EditNoteCubit',
    () {
      final note = Note(
        id: 1,
        title: 'New Note',
        body: 'New Description',
        created: DateTime.now(),
      );

      test('initial state is NoteInitial', () {
        expect(editNoteState, equals(const EditNoteState()));
      });
      group('deleteNote', () {
        test('emits [loading, success] when onSaveNoteButtonPressed is called',
            () {
          when(mockNoteRepository.updateNote(note: anyNamed('note')))
              .thenAnswer((_) async => right(Success.instance));

          expectLater(
            editNoteCubit.stream,
            emitsInOrder([
              editNoteState.copyWith(status: EditNotesStatus.loading),
              editNoteState.copyWith(status: EditNotesStatus.success),
            ]),
          );
          editNoteCubit.onSaveNoteButtonPressed(note);
        });

        test('emits loading and failure states when fetchNotes event fails',
            () {
          const errorMessage = 'Failed to fetch notes';
          when(mockNoteRepository.listenNotes()).thenAnswer(
            (_) => const Stream.empty(),
          );
          when(mockNoteRepository.updateNote(note: anyNamed('note')))
              .thenAnswer(
            (_) async => left(const CacheFailure(errorMessage: errorMessage)),
          );

          expectLater(
            editNoteCubit.stream,
            emitsInOrder([
              editNoteState.copyWith(status: EditNotesStatus.loading),
              editNoteState.copyWith(status: EditNotesStatus.success),
            ]),
          );
          editNoteCubit.onSaveNoteButtonPressed(note);
        });
      });
    },
  );
}
