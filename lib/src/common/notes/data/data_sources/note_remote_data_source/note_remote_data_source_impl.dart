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

  DocumentReference<Map<String, dynamic>> getNotesDocument() {
    return _cloudFireStore.collection('notes').doc();
  }

  @override
  Future<Success> clearNotes() {
    // TODO: implement clearNotes
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> fetchAllNotes() async {
    final user = await _authenticationRepository.user.first;
    final notesCollection = getNotesCollection();
    var notes = <Note>[];
    // Get docs from collection reference
    final snapshotDoc = await notesCollection.doc(user.id).get();
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
  }
}
