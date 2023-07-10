import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notes_app/src/common/common.dart';
import 'package:notes_app/src/core/core.dart';
import 'package:notes_app/src/features/edit_note/blocs/blocs.dart';
import 'package:notes_app/src/features/features.dart';

class MockNoteRepository extends Mock implements NoteRepository {}

void main() {
  late NoteBloc noteBloc;
  late EditNoteCubit editNoteCubit;
  late MockNoteRepository mockNoteRepository;

  final notes = <Note>[
    Note(
      id: 1,
      title: 'Title 1',
      body: 'Body 1',
      created: DateTime.now(),
    ),
    Note(
      id: 2,
      title: 'Title 2',
      body: 'Body 2',
      created: DateTime.now(),
    ),
    Note(
      id: 3,
      title: 'Title 3',
      body: 'Body 3',
      created: DateTime.now(),
    ),
  ];

  setUp(() {
    mockNoteRepository = MockNoteRepository();
    when(() => mockNoteRepository.listenNotes()).thenAnswer(
      (_) => const Stream.empty(),
    );
    noteBloc = NoteBloc(noteRepository: mockNoteRepository);
    editNoteCubit = EditNoteCubit(
      noteRepository: mockNoteRepository,
      noteCubit: noteBloc,
    );
    when(() => mockNoteRepository.fetchAllNotes())
        .thenAnswer((_) async => right(notes));
  });

  group('HomeScreen', () {
    testWidgets('renders HomeView', (tester) async {
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider<NoteBloc>(
              create: (context) => noteBloc,
            ),
            BlocProvider<EditNoteCubit>(
              create: (context) => editNoteCubit,
            ),
          ],
          child: const MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );

      expect(find.bySpecificType<HomeScreen>(), findsOneWidget);
    });
  });

  // testWidgets('renders a list of notes', (WidgetTester tester) async {
  //   // Build the HomeScreen with the list of notes
  //   await tester.pumpWidget(
  //     MultiBlocProvider(
  //       providers: [
  //         BlocProvider<NoteBloc>(
  //           create: (context) => noteBloc,
  //         ),
  //         BlocProvider<EditNoteCubit>(
  //           create: (context) => editNoteCubit,
  //         ),
  //       ],
  //       child: const MaterialApp(
  //         home: HomeScreen(),
  //       ),
  //     ),
  //   );

  //   // Verify that the list of notes is rendered correctly
  //   expect(find.text('Note 1'), findsOneWidget);
  //   expect(find.text('Note 2'), findsOneWidget);
  //   expect(find.text('Note 3'), findsOneWidget);

  //   // Verify that the content of the notes is rendered correctly
  //   expect(find.text('This is the content of Note 1'), findsOneWidget);
  //   expect(find.text('This is the content of Note 2'), findsOneWidget);
  //   expect(find.text('This is the content of Note 3'), findsOneWidget);
  // });
// }

  group('add Note floating action button', () {
    // GoRouter configuration
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
    testWidgets(
      'floating action button is rendered',
      (tester) async {
        await tester.pumpWidget(
          MultiBlocProvider(
            providers: [
              BlocProvider<NoteBloc>(
                create: (context) => noteBloc,
              ),
              BlocProvider<EditNoteCubit>(
                create: (context) => editNoteCubit,
              ),
            ],
            child: const MaterialApp(
              home: HomeScreen(),
            ),
          ),
        );

        expect(
          find.byKey(const ValueKey('floating_action_button')),
          findsOneWidget,
        );

        final addNoteFloatingActionButton =
            tester.widget(find.byKey(const ValueKey('floating_action_button')));
        expect(
          addNoteFloatingActionButton,
          isA<FloatingActionButton>(),
        );
      },
    );

    testWidgets(
      'navigates user to NoteEditScren',
      (tester) async {
        await tester.pumpWidget(
          MultiBlocProvider(
            providers: [
              BlocProvider<NoteBloc>(
                create: (context) => noteBloc,
              ),
              BlocProvider<EditNoteCubit>(
                create: (context) => editNoteCubit,
              ),
            ],
            child: MaterialApp.router(
              routeInformationProvider: router.routeInformationProvider,
              routerDelegate: router.routerDelegate,
              routerConfig: router,
            ),
          ),
        );

        await tester.tap(find.byKey(const ValueKey('floating_action_button')));

        final note = Note(
          id: 1,
          title: 'title',
          body: 'body',
          created: DateTime.now(),
        );

        verify(
          () => router.pushNamed(RouteConsts.noteDetailRoute, extra: note),
          //  navigator.push<void>(any(that: isRoute<void>())),
        ).called(1);
      },
    );
  });
}
