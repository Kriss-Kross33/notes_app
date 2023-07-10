part of 'note_local_data_source.dart';

class NoteLocalDataSourceImpl extends NoteLocalDataSource {
  NoteLocalDataSourceImpl({
    required IsarStorageService<Note> isarStorageService,
  }) : _isarStorageService = isarStorageService;

  final IsarStorageService<Note> _isarStorageService;
  @override
  Future<List<Note>> fetchAllNotes() async {
    try {
      final notes = await _isarStorageService.fetchNotes();
      return notes;
    } catch (e) {
      throw CacheException(
        errorMessage: e.toString(),
      );
    }
  }

  @override
  Future<Success> updateNote({required Note note}) async {
    return _manageNote(() async => _isarStorageService.updateNote(note));
  }

  @override
  Future<Success> deleteNote({required int id}) async {
    return _manageNote(() async => _isarStorageService.deleteNote(id));
  }

  @override
  Stream<List<Note>> listenNotes() async* {
    try {
      yield* _isarStorageService.listenForNotes();
    } catch (e) {
      throw CacheException(
        errorMessage: e.toString(),
      );
    }
  }

  Future<Success> _manageNote(
    Future<void> Function() noteManager,
  ) async {
    try {
      await noteManager();
      return Success.instance;
    } catch (e) {
      throw CacheException(
        errorMessage: e.toString(),
      );
    }
  }

  @override
  Future<Success> clearNotes() {
    return _manageNote(() async => _isarStorageService.clearNotes());
  }
}
