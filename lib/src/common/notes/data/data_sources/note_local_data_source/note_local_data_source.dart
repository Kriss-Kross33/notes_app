import 'package:errors/errors.dart';
import 'package:isar_storage_service/isar_storage_service.dart';
import 'package:notes_app/src/common/notes/domain/domain.dart';

part 'note_local_data_source_impl.dart';

/// {@template note_local_data_source}
/// Manages Note data stored in the database
/// {@endtemplate}
abstract class NoteLocalDataSource {
  /// Returns the list of notes from the local database
  Future<List<Note>> fetchAllNotes();

  /// Updates a Note
  ///
  /// A [note] parameter must be provided to the local database service
  /// to update the note.
  Future<Success> updateNote({
    required Note note,
  });

  /// Deletes a Note
  ///
  /// A required [id] which is the id of the note must be provided to
  /// the Local database service for deletion of the note.
  Future<void> deleteNote({required int id});

  /// Listens for Note changes
  Stream<List<Note>> listenNotes();
}
