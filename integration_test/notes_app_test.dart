import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notes_app/main.dart' as app;

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route<dynamic> {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockNavigatorObserver mockNavigatorObserver;

  setUp(() {
    mockNavigatorObserver = MockNavigatorObserver();
  });

  setUpAll(() {
    registerFallbackValue(FakeRoute());
  });

  group('add notes test test', () {
    testWidgets('', (tester) async {
      await app.main();
      await tester.pumpAndSettle();
      await splashToHome(tester);
      await createNote(tester);
      await noteDetail(tester);
      await editNote(tester);
    });
  });
}

Future<void> splashToHome(WidgetTester tester) async {
  // find splash screen
  tester.element(find.byKey(const Key('splash')));
  // wait for 5 seconds for splash screen to navigate to home page
  await tester.pumpAndSettle(const Duration(seconds: 3));
  // find the home screen
  tester.element(find.byKey(const ValueKey('home')));
  // find the `Notes` text on the home screen
  final notesText = find.text('Notes');
  expect(notesText, findsOneWidget);
  tester.element(find.byKey(const ValueKey('empty_widget')));
  await tester.pumpAndSettle(const Duration(seconds: 2));
  final floatingActionButton = find.byKey(const Key('floating_action_button'));
  await tester.tap(floatingActionButton);
  expect(floatingActionButton, findsOneWidget);
  await tester.pumpAndSettle();
}

Future<void> createNote(WidgetTester tester) async {
  expect(find.byKey(const ValueKey('edit_note')), findsOneWidget);
  await tester.enterText(
    find.byKey(const ValueKey('note_title')),
    'This is the title',
  );
  await tester.enterText(
    find.byKey(const ValueKey('note_body')),
    'This is the body text',
  );
  await tester.pumpAndSettle(const Duration(seconds: 2));
  await saveNoteAndNavigateToHome(tester);
}

Future<void> noteDetail(WidgetTester tester) async {
  final noteItem = find.byKey(const Key('note_item_0'));
  expect(noteItem, findsOneWidget);
  await tester.tap(noteItem);
  await tester.pumpAndSettle();

  expect(find.byKey(const ValueKey('note_detail')), findsOneWidget);
  final titleText = find.text('This is the title');
  expect(titleText, findsOneWidget);
  final bodyText = find.text('This is the body text');
  expect(bodyText, findsOneWidget);
  await tester.pumpAndSettle(const Duration(seconds: 2));
  await tester.tap(find.byKey(const Key('edit_note_icon')));
  await tester.pumpAndSettle();
}

Future<void> editNote(WidgetTester tester) async {
  expect(find.byKey(const ValueKey('edit_note')), findsOneWidget);
  await tester.enterText(
    find.byKey(const ValueKey('note_title')),
    'This is the edited title',
  );
  await tester.enterText(
    find.byKey(const ValueKey('note_body')),
    'This is the edited body text',
  );
  await tester.pumpAndSettle(const Duration(seconds: 2));
  await saveNoteAndNavigateToHome(tester);
}

Future<void> noteDetailAndEditNote(WidgetTester tester) async {}

Future<void> saveNoteAndNavigateToHome(WidgetTester tester) async {
  await tester.tap(
    find.byKey(const ValueKey('save_note_icon')),
  );
  await tester.pumpAndSettle(const Duration(seconds: 2));

  await tester.tap(
    find.byKey(const ValueKey('save_note_button')),
  );
  await tester.pumpAndSettle(const Duration(seconds: 2));
  expect(find.byKey(const ValueKey('home')), findsOneWidget);
  await tester.pumpAndSettle(const Duration(seconds: 3));
}
