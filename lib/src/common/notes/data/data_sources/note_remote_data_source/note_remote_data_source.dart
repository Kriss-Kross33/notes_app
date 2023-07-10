import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/src/common/common.dart';

part 'note_remote_data_source_impl.dart';

/// {@template note_remote_data_source}
/// Contract of
/// {@endtemplate}
abstract class NoteRemoteDataSource {
  /// Returns the list of notes from the data source
  Future<List<Note>> fetchAllNotes();

  /// Creates all notes saved to cloud.
  Future<Success> clearNotes();
}
