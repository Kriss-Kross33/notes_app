// ignore_for_file: public_member_api_docs

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_check_service/internet_connection_check_service.dart';
import 'package:isar_storage_service/isar_storage_service.dart';
import 'package:notes_app/src/common/common.dart';
import 'package:notes_app/src/core/core.dart';
import 'package:notes_app/src/features/edit_note/blocs/blocs.dart';
import 'package:notes_app/src/features/features.dart';

///
class NotesApp extends StatelessWidget {
  ///
  const NotesApp({
    required IsarStorageService<Note> isarStorageService,
    required NoteRepository notesRepository,
    required AuthenticationRepository authenticationRepository,
    required InternetConnectionCheckService internetConnectionCheckService,
    super.key,
  })  : _authenticationRepository = authenticationRepository,
        _isarStorageService = isarStorageService,
        _internetConnectionCheckService = internetConnectionCheckService,
        _notesRepository = notesRepository;

  final IsarStorageService<Note> _isarStorageService;
  final InternetConnectionCheckService _internetConnectionCheckService;

  final NoteRepository _notesRepository;
  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _isarStorageService),
        RepositoryProvider.value(value: _notesRepository),
        RepositoryProvider.value(value: _authenticationRepository),
        RepositoryProvider.value(
          value: _internetConnectionCheckService,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(
              repository: _authenticationRepository,
            ),
          ),
          BlocProvider<NoteBloc>(
            create: (context) => NoteBloc(
              noteRepository: context.read<NoteRepository>(),
            ),
          ),
          BlocProvider<SearchNotesCubit>(
            create: (context) => SearchNotesCubit(context.read<NoteBloc>()),
          ),
          BlocProvider<EditNoteCubit>(
            create: (context) => EditNoteCubit(
              noteRepository: _notesRepository,
              noteCubit: context.read<NoteBloc>(),
            ),
          ),
          BlocProvider<CheckInternetConnectionBloc>(
            create: (BuildContext context) => CheckInternetConnectionBloc(
              internetConnectionCheckService: _internetConnectionCheckService,
              noteRepository: _notesRepository,
            )..add(StartCheckInternetConnection()),
          ),
        ],
        child: BlocListener<CheckInternetConnectionBloc,
            CheckInternetConnectionState>(
          listener: (context, state) async {
            if (state.connectionStatus == ConnectionStatus.disconnected) {
              debugPrint('DISCONNECTED');
            } else if (state.connectionStatus == ConnectionStatus.connected) {
              debugPrint('CONNECTED');
            }
          },
          child: const NotesAppView(),
        ),
      ),
    );
  }
}

class NotesAppView extends StatelessWidget {
  const NotesAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
    );
  }
}
