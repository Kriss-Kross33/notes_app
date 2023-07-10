import 'package:flutter_test/flutter_test.dart';
import 'package:notes_app/src/common/common.dart';
import 'package:notes_app/src/features/features.dart';

void main() {
  late NoteState noteState;

  setUp(() {
    noteState = const NoteState();
  });

  group('NoteState', () {
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
    test('supports value comparisons', () {
      expect(const NoteState(), const NoteState());
    });

    test('returns same object when no properties are passed', () {
      expect(noteState.copyWith(), noteState);
    });

    test('returns object with updated status when status is passed', () {
      expect(
        noteState.copyWith(status: NotesStatus.initial),
        noteState,
      );
    });

    test('returns object with updated List<Note> when List<Note> is passed',
        () {
      expect(
        noteState.copyWith(notes: notes),
        NoteState(notes: notes),
      );
    });
  });
}
