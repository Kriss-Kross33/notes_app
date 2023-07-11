import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';
import 'package:notes_app/src/common/notes/domain/domain.dart';

/// {@template authentication_repository}
/// Repository which manages text notes.
///
/// {@endtemplate}
abstract class NoteRepository {
  /// Returns the list of notes from the data source
  ///
  /// Returns a [Failure] when an error occurs
  Future<Either<Failure, List<Note>>> fetchAllNotes();

  /// Updates a Note or Creates one if id isn't present
  ///
  /// Returns [Success] when the note has been updated successfully.
  /// Returns a [Failure] when an error occurs.
  Future<Either<Failure, Success>> updateNote({
    required Note note,
  });

  /// Deletes a Note
  ///
  /// Returns [Success] when the note has been deleted successfully.
  /// Returns a [Failure] when an error occurs.
  Future<Either<Failure, Success>> deleteNote({
    required int id,
    required Note note,
  });

  /// Clears note from local database
  Future<Either<Failure, Success>> clearNotes();

  /// Listens for changes to notes.
  Stream<List<Note>> listenNotes();

  /// Sync cached notes with cloud
  Future<void> syncNotes();

  /// Sync notes from cloud to local database
  Future<Either<Failure, Success>> syncFromCloudToLocalDb();
}
