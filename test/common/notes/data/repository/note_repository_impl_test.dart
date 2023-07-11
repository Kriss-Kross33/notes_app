import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_app/src/common/notes/notes.dart';

import 'note_repository_impl_test.mocks.dart';

@GenerateMocks([
  NoteLocalDataSource,
  NoteRemoteDataSource,
  AuthenticationRepository,
])
void main() {
  late MockNoteLocalDataSource mockNoteLocalDataSource;
  late MockNoteRemoteDataSource mockNoteRemoteDataSource;
  late MockAuthenticationRepository mockAuthenticationRepository;
  late NoteRepository noteRepository;

  setUp(() {
    mockNoteLocalDataSource = MockNoteLocalDataSource();
    mockNoteRemoteDataSource = MockNoteRemoteDataSource();
    mockAuthenticationRepository = MockAuthenticationRepository();

    noteRepository = NoteRepositoryImpl(
      localDataSource: mockNoteLocalDataSource,
      authenticationRepository: mockAuthenticationRepository,
      remoteDataSource: mockNoteRemoteDataSource,
    );
  });

  group('updateNote', () {
    final note = Note(
      id: 1,
      title: 'title',
      body: 'body',
      created: DateTime.now(),
    );

    test('shoudld save the created/updated note to local data source',
        () async {
      //* arrange
      when(mockNoteLocalDataSource.updateNote(note: anyNamed('note')))
          .thenAnswer((_) async => Success.instance);
      //* act
      final result = await noteRepository.updateNote(note: note);
      //* assert
      verify(mockNoteLocalDataSource.updateNote(note: note));
      expect(result, equals(Right(Success.instance)));
    });
  });

  group('fetchNotes', () {
    final notes = [
      Note(
        id: 1,
        title: 'title',
        body: 'body',
        created: DateTime.now(),
      ),
      Note(
        id: 2,
        title: 'title 2',
        body: 'body 2',
        created: DateTime.now(),
      ),
    ];

    test('shoudld fetch list of notes from the local data source', () async {
      //* arrange
      when(mockNoteLocalDataSource.fetchAllNotes())
          .thenAnswer((_) async => notes);
      //* act
      final result = await noteRepository.fetchAllNotes();
      //* assert
      verify(mockNoteLocalDataSource.fetchAllNotes());
      expect(result, equals(Right(notes)));
    });
  });
}
