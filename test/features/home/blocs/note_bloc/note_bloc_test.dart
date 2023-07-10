import 'package:errors/errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_app/src/common/common.dart';
import 'package:notes_app/src/features/features.dart';

import 'note_bloc_test.mocks.dart';

@GenerateMocks([NoteRepository])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late NoteBloc noteBloc;
  late NoteState noteState;
  late MockNoteRepository mockNoteRepository;

  setUp(() {
    mockNoteRepository = MockNoteRepository();
    when(mockNoteRepository.listenNotes()).thenAnswer(
      (_) => const Stream.empty(),
    );
    noteBloc = NoteBloc(noteRepository: mockNoteRepository);

    noteState = const NoteState();
  });

  tearDown(() {
    noteBloc.close();
  });

  test('initial NoteBloc state', () {
    expect(
      NoteBloc(noteRepository: mockNoteRepository).state,
      const NoteState(),
    );
  });

  group(
    'NoteBloc',
    () {
      final note = Note(
        id: 1,
        title: 'New Note',
        body: 'New Description',
        created: DateTime.now(),
      );

      final notes = [
        Note(
          id: 1,
          title: 'Note 1',
          body: 'Description 1',
          created: DateTime.now(),
        ),
        Note(
          id: 2,
          title: 'Note 2',
          body: 'Description 2',
          created: DateTime.now(),
        ),
      ];

      test('initial state of NoteBloc', () {
        expect(noteState, equals(const NoteState()));
      });

      test('emits loading and loaded states when fetchAllNotes is called', () {
        when(mockNoteRepository.fetchAllNotes())
            .thenAnswer((_) async => right(notes));

        expectLater(
          noteBloc.stream,
          emitsInOrder([
            noteState.copyWith(status: NotesStatus.loading),
            noteState.copyWith(status: NotesStatus.success, notes: notes),
          ]),
        );

        noteBloc.add(FetchNotesEvent());
      });

      test('emits loading and failure states when fetchNotes event fails', () {
        const errorMessage = 'Failed to fetch notes';

        when(mockNoteRepository.fetchAllNotes()).thenAnswer(
          (realInvocation) async =>
              left(const CacheFailure(errorMessage: errorMessage)),
        );

        expectLater(
          noteBloc.stream,
          emitsInOrder([
            noteState.copyWith(status: NotesStatus.loading),
            noteState.copyWith(
              status: NotesStatus.failure,
            ),
          ]),
        );

        noteBloc.add(FetchNotesEvent());
      });

      test('emits [loading, success] when deleteNote is called', () {
        when(
          mockNoteRepository.deleteNote(
            id: anyNamed('id'),
            note: anyNamed('note'),
          ),
        ).thenAnswer((_) async => right(Success.instance));

        when(mockNoteRepository.fetchAllNotes())
            .thenAnswer((_) async => right(notes));

        expectLater(
          noteBloc.stream,
          emitsInOrder([
            noteState.copyWith(status: NotesStatus.loading),
            noteState.copyWith(status: NotesStatus.success),
          ]),
        );
        noteBloc.add(
          DeleteNoteEvent(
            id: note.id,
            note: note,
          ),
        );
      });

      test('emits loading and failure states when deleteNote event fails', () {
        const errorMessage = 'Failed to fetch notes';

        when(
          mockNoteRepository.deleteNote(
            id: anyNamed('id'),
            note: anyNamed('note'),
          ),
        ).thenAnswer(
          (realInvocation) async =>
              left(const CacheFailure(errorMessage: errorMessage)),
        );

        expectLater(
          noteBloc.stream,
          emitsInOrder([
            noteState.copyWith(status: NotesStatus.loading),
            noteState.copyWith(
              status: NotesStatus.failure,
            ),
          ]),
        );

        noteBloc.add(
          DeleteNoteEvent(
            id: note.id,
            note: note,
          ),
        );
      });
    },
  );
}
