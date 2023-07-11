import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_check_service/internet_connection_check_service.dart';
import 'package:isar_storage_service/isar_storage_service.dart';
import 'package:notes_app/firebase_options.dart';
import 'package:notes_app/src/common/common.dart';
import 'package:notes_app/src/notes_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'kng-notes-app',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom],
  );
  final internetConnectionCheckService = InternetConnectionCheckService();
  final isarStorageService = IsarStorageService<Note>([NoteSchema]);
  await isarStorageService.openDB(schemas: [NoteSchema]);

  final notesLocalDataSource =
      NoteLocalDataSourceImpl(isarStorageService: isarStorageService);

  final authenticationRepository = AuthenticationRepository();

  final remoteDataSource = NoteRemoteDataSourceImpl(
    authenticationRepository: authenticationRepository,
  );

  final cloudFireStore = FirebaseFirestore.instance
    ..settings = const Settings(persistenceEnabled: true);

  final notesRepository = NoteRepositoryImpl(
    localDataSource: notesLocalDataSource,
    authenticationRepository: authenticationRepository,
    remoteDataSource: remoteDataSource,
  );

  // Bloc.observer = SimpleBlocObserver();

  runApp(
    NotesApp(
      isarStorageService: isarStorageService,
      notesRepository: notesRepository,
      authenticationRepository: authenticationRepository,
      internetConnectionCheckService: internetConnectionCheckService,
    ),
  );
}
