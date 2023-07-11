import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
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

  group('add Note floating action button', () {
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
  });
}
