import 'package:flutter_test/flutter_test.dart';
import 'package:isar_storage_service/isar_storage_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_app/src/common/common.dart';

import 'note_local_data_source_impl_test.mocks.dart';

@GenerateMocks([IsarStorageService<Note>])
void main() {
  late NoteLocalDataSource localDataSource;
  late MockIsarStorageService<Note> mockIsarStorageService;

  setUp(() {
    mockIsarStorageService = MockIsarStorageService<Note>();
    localDataSource =
        NoteLocalDataSourceImpl(isarStorageService: mockIsarStorageService);
  });

  final notes = [
    Note(
      id: 1,
      title: 'New Note',
      body: 'New Description',
      created: DateTime.now(),
    ),
  ];

  group('fetchAllNotes', () {
    test('should fetch locally cached notes form IsarStorageService', () async {
      //* arrange
      when(mockIsarStorageService.fetchNotes()).thenAnswer(
        (_) => Future.value(notes),
      );
      //*act
      final result = await localDataSource.fetchAllNotes();
      //* assert
      verify(mockIsarStorageService.fetchNotes());
      expect(result, equals(notes));
    });
  });

  group('updateNote', () {
    test(
        'should cache newly created note or update a note if id is note present',
        () async {
      //* arrange
      when(mockIsarStorageService.updateNote(any)).thenAnswer(
        (_) async {},
      );
      //*act
      await localDataSource.updateNote(note: notes.first);
      //* assert
      verify(mockIsarStorageService.updateNote(notes.first)).called(1);
    });
  });

  group('deleteNote', () {
    test('should delete a note with a provided [id]', () async {
      //* arrange
      when(mockIsarStorageService.deleteNote(any)).thenAnswer(
        (_) async => Future.value(true),
      );
      //*act
      await localDataSource.deleteNote(id: notes.first.id);
      //* assert
      verify(mockIsarStorageService.deleteNote(notes.first.id)).called(1);
    });
  });
}
