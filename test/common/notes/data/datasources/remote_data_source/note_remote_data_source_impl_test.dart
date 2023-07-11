import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_app/src/common/common.dart';

import 'note_remote_data_source_impl_test.mocks.dart';

@GenerateMocks(
  [
    AuthenticationRepository,
    FirebaseFirestore,
    CollectionReference<Map<String, dynamic>>,
    DocumentReference
  ],
)
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late NoteRemoteDataSourceImpl noteRemoteDataSource;
  late MockCollectionReference<Map<String, dynamic>> mockCollectionReference;
  late MockAuthenticationRepository mockAuthenticationRepository;
  late MockFirebaseFirestore mockFirebaseFirestore;

  setupFirebaseCoreMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    mockFirebaseFirestore = MockFirebaseFirestore();

    noteRemoteDataSource = NoteRemoteDataSourceImpl(
      authenticationRepository: mockAuthenticationRepository,
      cloudFireStore: mockFirebaseFirestore,
    );
    mockCollectionReference = MockCollectionReference<Map<String, dynamic>>();

    //  collRef = mockFirebaseFirestore.collection('notes');
    // when(mockFirebaseFirestore.collection('notes')).thenReturn(collRef);

    //   docRef = mockFirebaseFirestore.collection('notes').doc('1');
  });

  test('returns the notes collection', () async {
    //* arrange
    when(mockFirebaseFirestore.collection(any))
        .thenReturn(mockCollectionReference);
    //* act
    final result = noteRemoteDataSource.getNotesCollection();
    //* assert
    verify(mockFirebaseFirestore.collection('notes'));
    expect(result, equals(mockCollectionReference));
    // expect(result, equals(collRef));
  });
}
