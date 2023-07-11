part of 'note_remote_data_source.dart';

class NoteRemoteDataSourceImpl extends NoteRemoteDataSource {
  NoteRemoteDataSourceImpl({
    required AuthenticationRepository authenticationRepository,
    FirebaseFirestore? cloudFireStore,
  })  : _authenticationRepository = authenticationRepository,
        _cloudFireStore = cloudFireStore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _cloudFireStore;
  final AuthenticationRepository _authenticationRepository;

  CollectionReference<Map<String, dynamic>> getNotesCollection() {
    return _cloudFireStore.collection('notes');
  }

  @override
  Future<Success> clearNotes() async {
    try {
      final noteCollection = getNotesCollection();
      final user = await _authenticationRepository.user.first;
      await noteCollection.doc(user.id).delete();
      return Success.instance;
    } catch (e) {
      throw const CacheException(
        errorMessage: 'Error retrieving notes from cloud',
      );
    }
  }

  @override
  Future<List<Note>> fetchAllNotes() async {
    try {
      final user = await _authenticationRepository.user.first;
      final notesCollection = getNotesCollection();
      final notes = <Note>[];
      // Get docs from collection reference
      final snapshotDoc = await notesCollection.doc(user.id).get();
      // Check if documents exists
      if (snapshotDoc.exists) {
        final data = snapshotDoc.data();
        if (data != null) {
          final result = data['notesData'] as List<dynamic>;
          for (final noteMap in result) {
            notes.add(Note.fromJson(noteMap as Map<String, dynamic>));
          }
        }
      }
      return notes;
    } catch (e) {
      throw const CacheException(
        errorMessage: 'Error retrieving notes from cloud',
      );
    }
  }

  @override
  Future<Success> deleteNote(Note note) async {
    try {
      final noteCollection = getNotesCollection();
      final user = await _authenticationRepository.user.first;
      await noteCollection.doc(user.id).update(
        {
          'notesData': FieldValue.arrayRemove([note.toJson()])
        },
      );
      return Success.instance;
    } catch (e) {
      throw const CacheException(
        errorMessage: 'Error retrieving notes from cloud',
      );
    }
  }
}
