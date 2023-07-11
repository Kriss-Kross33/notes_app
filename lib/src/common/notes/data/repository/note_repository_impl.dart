import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';
import 'package:notes_app/src/common/notes/data/data.dart';
import 'package:notes_app/src/common/notes/data/data_sources/note_remote_data_source/note_remote_data_source.dart';
import 'package:notes_app/src/common/notes/domain/domain.dart';

///
class NoteRepositoryImpl extends NoteRepository {
  /// {@macro note_repository_impl}
  NoteRepositoryImpl({
    required NoteLocalDataSource localDataSource,
    required AuthenticationRepository authenticationRepository,
    required NoteRemoteDataSource remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource,
        _authenticationRepository = authenticationRepository;

  final NoteLocalDataSource _localDataSource;
  final NoteRemoteDataSource _remoteDataSource;

  final AuthenticationRepository _authenticationRepository;

  @override
  Future<Either<Failure, Success>> deleteNote({
    required int id,
    required Note note,
  }) async {
    try {
      await _localDataSource.deleteNote(id: id);
      return right(Success.instance);
    } on CacheException catch (e) {
      return left(CacheFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> fetchAllNotes() async {
    try {
      final notes = await _localDataSource.fetchAllNotes();
      if (notes.isEmpty) {
        throw const EmptyCacheException(errorMessage: 'No Note found');
      }
      return right(notes);
    } on EmptyCacheException catch (e) {
      return left(EmptyCacheFailure(errorMessage: e.errorMessage));
    } on CacheException catch (e) {
      return left(CacheFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Success>> updateNote({
    required Note note,
  }) async {
    try {
      await _localDataSource.updateNote(note: note);
      return right(Success.instance);
    } on CacheException catch (e) {
      return left(CacheFailure(errorMessage: e.toString()));
    }
  }

  @override
  Stream<List<Note>> listenNotes() async* {
    yield* _localDataSource.listenNotes();
  }

  /// Retrieve all Note objects for the user from IsarService and syncs to cloud
  @override
  Future<void> syncNotes() async {
    final firebaseFirestore = FirebaseFirestore.instance;
    // Sync each Note with Firestore
    final notes = await _localDataSource.fetchAllNotes();

    for (final note in notes) {
      try {
        // Get the Firestore document reference for the Note
        final user = await _authenticationRepository.user.first;
        await firebaseFirestore.collection('notes').doc(user.id).set(
          {
            'notesData': FieldValue.arrayUnion([note.toJson()])
          },
          SetOptions(merge: true),
        );
      } catch (e) {
        print('Failed to sync  ${note.id}: $e');
      }
    }
  }

  // Future<void> checkforlasttimestamp() async {
  //   final firebaseFirestore = FirebaseFirestore.instance;
  //   await firebaseFirestore.collection('notes').get().then((querySnapshot) {
  //     for (final result in querySnapshot.docs) {
  //       final data = result.data()['notesData'] as List<dynamic>;
  //       final time = data.first['created'] as Timestamp;
  //       final created = time.toDate();
  //       print('{CREATED $created');
  //     }
  //   });
  // }

  @override
  Future<Either<Failure, Success>> clearNotes() async {
    try {
      await _localDataSource.clearNotes();
      return right(Success.instance);
    } on CacheException catch (e) {
      return left(CacheFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Success>> syncFromCloudToLocalDb() async {
    try {
      final remoteNotes = await _remoteDataSource.fetchAllNotes();
      if (remoteNotes.isEmpty) {
        throw const CacheException(errorMessage: 'No cache present');
      }
      for (final note in remoteNotes) {
        await _localDataSource.updateNote(note: note);
      }
      return right(Success.instance);
    } on CacheException catch (e) {
      return left(CacheFailure(errorMessage: e.toString()));
    }
  }
}
