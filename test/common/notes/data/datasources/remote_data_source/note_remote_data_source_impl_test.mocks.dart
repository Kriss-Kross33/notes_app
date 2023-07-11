// Mocks generated by Mockito 5.4.2 from annotations
// in notes_app/test/common/notes/data/datasources/remote_data_source/note_remote_data_source_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:typed_data' as _i8;

import 'package:authentication_repository/src/authentication_repository.dart'
    as _i6;
import 'package:authentication_repository/src/models/user_model.dart' as _i7;
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i2;
import 'package:firebase_core/firebase_core.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i9;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUserCredential_0 extends _i1.SmartFake
    implements _i2.UserCredential {
  _FakeUserCredential_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFirebaseApp_1 extends _i1.SmartFake implements _i3.FirebaseApp {
  _FakeFirebaseApp_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSettings_2 extends _i1.SmartFake implements _i4.Settings {
  _FakeSettings_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCollectionReference_3<T extends Object?> extends _i1.SmartFake
    implements _i4.CollectionReference<T> {
  _FakeCollectionReference_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWriteBatch_4 extends _i1.SmartFake implements _i4.WriteBatch {
  _FakeWriteBatch_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLoadBundleTask_5 extends _i1.SmartFake
    implements _i4.LoadBundleTask {
  _FakeLoadBundleTask_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeQuerySnapshot_6<T1 extends Object?> extends _i1.SmartFake
    implements _i4.QuerySnapshot<T1> {
  _FakeQuerySnapshot_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeQuery_7<T extends Object?> extends _i1.SmartFake
    implements _i4.Query<T> {
  _FakeQuery_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDocumentReference_8<T extends Object?> extends _i1.SmartFake
    implements _i4.DocumentReference<T> {
  _FakeDocumentReference_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFuture_9<T1> extends _i1.SmartFake implements _i5.Future<T1> {
  _FakeFuture_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFirebaseFirestore_10 extends _i1.SmartFake
    implements _i4.FirebaseFirestore {
  _FakeFirebaseFirestore_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAggregateQuery_11 extends _i1.SmartFake
    implements _i4.AggregateQuery {
  _FakeAggregateQuery_11(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDocumentSnapshot_12<T1 extends Object?> extends _i1.SmartFake
    implements _i4.DocumentSnapshot<T1> {
  _FakeDocumentSnapshot_12(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthenticationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationRepository extends _i1.Mock
    implements _i6.AuthenticationRepository {
  MockAuthenticationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Stream<_i7.UserModel> get user => (super.noSuchMethod(
        Invocation.getter(#user),
        returnValue: _i5.Stream<_i7.UserModel>.empty(),
      ) as _i5.Stream<_i7.UserModel>);
  @override
  _i5.Future<void> loginWithEmailAndPassword({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #loginWithEmailAndPassword,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> signup({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #signup,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> convertUserWithEmail({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #convertUserWithEmail,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> convertUserWithGmail(_i2.AuthCredential? credential) =>
      (super.noSuchMethod(
        Invocation.method(
          #convertUserWithGmail,
          [credential],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> loginWithGoogle() => (super.noSuchMethod(
        Invocation.method(
          #loginWithGoogle,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  bool isLoggedIn() => (super.noSuchMethod(
        Invocation.method(
          #isLoggedIn,
          [],
        ),
        returnValue: false,
      ) as bool);
  @override
  _i5.Future<_i2.UserCredential> signInAnonymously() => (super.noSuchMethod(
        Invocation.method(
          #signInAnonymously,
          [],
        ),
        returnValue: _i5.Future<_i2.UserCredential>.value(_FakeUserCredential_0(
          this,
          Invocation.method(
            #signInAnonymously,
            [],
          ),
        )),
      ) as _i5.Future<_i2.UserCredential>);
  @override
  _i5.Future<void> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}

/// A class which mocks [FirebaseFirestore].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseFirestore extends _i1.Mock implements _i4.FirebaseFirestore {
  MockFirebaseFirestore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.FirebaseApp get app => (super.noSuchMethod(
        Invocation.getter(#app),
        returnValue: _FakeFirebaseApp_1(
          this,
          Invocation.getter(#app),
        ),
      ) as _i3.FirebaseApp);
  @override
  set app(_i3.FirebaseApp? _app) => super.noSuchMethod(
        Invocation.setter(
          #app,
          _app,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set settings(_i4.Settings? settings) => super.noSuchMethod(
        Invocation.setter(
          #settings,
          settings,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Settings get settings => (super.noSuchMethod(
        Invocation.getter(#settings),
        returnValue: _FakeSettings_2(
          this,
          Invocation.getter(#settings),
        ),
      ) as _i4.Settings);
  @override
  Map<dynamic, dynamic> get pluginConstants => (super.noSuchMethod(
        Invocation.getter(#pluginConstants),
        returnValue: <dynamic, dynamic>{},
      ) as Map<dynamic, dynamic>);
  @override
  _i4.CollectionReference<Map<String, dynamic>> collection(
          String? collectionPath) =>
      (super.noSuchMethod(
        Invocation.method(
          #collection,
          [collectionPath],
        ),
        returnValue: _FakeCollectionReference_3<Map<String, dynamic>>(
          this,
          Invocation.method(
            #collection,
            [collectionPath],
          ),
        ),
      ) as _i4.CollectionReference<Map<String, dynamic>>);
  @override
  _i4.WriteBatch batch() => (super.noSuchMethod(
        Invocation.method(
          #batch,
          [],
        ),
        returnValue: _FakeWriteBatch_4(
          this,
          Invocation.method(
            #batch,
            [],
          ),
        ),
      ) as _i4.WriteBatch);
  @override
  _i5.Future<void> clearPersistence() => (super.noSuchMethod(
        Invocation.method(
          #clearPersistence,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> enablePersistence(
          [_i4.PersistenceSettings? persistenceSettings]) =>
      (super.noSuchMethod(
        Invocation.method(
          #enablePersistence,
          [persistenceSettings],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i4.LoadBundleTask loadBundle(_i8.Uint8List? bundle) => (super.noSuchMethod(
        Invocation.method(
          #loadBundle,
          [bundle],
        ),
        returnValue: _FakeLoadBundleTask_5(
          this,
          Invocation.method(
            #loadBundle,
            [bundle],
          ),
        ),
      ) as _i4.LoadBundleTask);
  @override
  void useFirestoreEmulator(
    String? host,
    int? port, {
    bool? sslEnabled = false,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #useFirestoreEmulator,
          [
            host,
            port,
          ],
          {#sslEnabled: sslEnabled},
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.Future<_i4.QuerySnapshot<T>> namedQueryWithConverterGet<T>(
    String? name, {
    _i4.GetOptions? options = const _i4.GetOptions(),
    required _i4.FromFirestore<T>? fromFirestore,
    required _i4.ToFirestore<T>? toFirestore,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #namedQueryWithConverterGet,
          [name],
          {
            #options: options,
            #fromFirestore: fromFirestore,
            #toFirestore: toFirestore,
          },
        ),
        returnValue:
            _i5.Future<_i4.QuerySnapshot<T>>.value(_FakeQuerySnapshot_6<T>(
          this,
          Invocation.method(
            #namedQueryWithConverterGet,
            [name],
            {
              #options: options,
              #fromFirestore: fromFirestore,
              #toFirestore: toFirestore,
            },
          ),
        )),
      ) as _i5.Future<_i4.QuerySnapshot<T>>);
  @override
  _i5.Future<_i4.QuerySnapshot<Map<String, dynamic>>> namedQueryGet(
    String? name, {
    _i4.GetOptions? options = const _i4.GetOptions(),
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #namedQueryGet,
          [name],
          {#options: options},
        ),
        returnValue: _i5.Future<_i4.QuerySnapshot<Map<String, dynamic>>>.value(
            _FakeQuerySnapshot_6<Map<String, dynamic>>(
          this,
          Invocation.method(
            #namedQueryGet,
            [name],
            {#options: options},
          ),
        )),
      ) as _i5.Future<_i4.QuerySnapshot<Map<String, dynamic>>>);
  @override
  _i4.Query<Map<String, dynamic>> collectionGroup(String? collectionPath) =>
      (super.noSuchMethod(
        Invocation.method(
          #collectionGroup,
          [collectionPath],
        ),
        returnValue: _FakeQuery_7<Map<String, dynamic>>(
          this,
          Invocation.method(
            #collectionGroup,
            [collectionPath],
          ),
        ),
      ) as _i4.Query<Map<String, dynamic>>);
  @override
  _i5.Future<void> disableNetwork() => (super.noSuchMethod(
        Invocation.method(
          #disableNetwork,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i4.DocumentReference<Map<String, dynamic>> doc(String? documentPath) =>
      (super.noSuchMethod(
        Invocation.method(
          #doc,
          [documentPath],
        ),
        returnValue: _FakeDocumentReference_8<Map<String, dynamic>>(
          this,
          Invocation.method(
            #doc,
            [documentPath],
          ),
        ),
      ) as _i4.DocumentReference<Map<String, dynamic>>);
  @override
  _i5.Future<void> enableNetwork() => (super.noSuchMethod(
        Invocation.method(
          #enableNetwork,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Stream<void> snapshotsInSync() => (super.noSuchMethod(
        Invocation.method(
          #snapshotsInSync,
          [],
        ),
        returnValue: _i5.Stream<void>.empty(),
      ) as _i5.Stream<void>);
  @override
  _i5.Future<T> runTransaction<T>(
    _i4.TransactionHandler<T>? transactionHandler, {
    Duration? timeout = const Duration(seconds: 30),
    int? maxAttempts = 5,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #runTransaction,
          [transactionHandler],
          {
            #timeout: timeout,
            #maxAttempts: maxAttempts,
          },
        ),
        returnValue: _i9.ifNotNull(
              _i9.dummyValueOrNull<T>(
                this,
                Invocation.method(
                  #runTransaction,
                  [transactionHandler],
                  {
                    #timeout: timeout,
                    #maxAttempts: maxAttempts,
                  },
                ),
              ),
              (T v) => _i5.Future<T>.value(v),
            ) ??
            _FakeFuture_9<T>(
              this,
              Invocation.method(
                #runTransaction,
                [transactionHandler],
                {
                  #timeout: timeout,
                  #maxAttempts: maxAttempts,
                },
              ),
            ),
      ) as _i5.Future<T>);
  @override
  _i5.Future<void> terminate() => (super.noSuchMethod(
        Invocation.method(
          #terminate,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> waitForPendingWrites() => (super.noSuchMethod(
        Invocation.method(
          #waitForPendingWrites,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> setIndexConfiguration({
    required List<_i4.Index>? indexes,
    List<_i4.FieldOverrides>? fieldOverrides,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setIndexConfiguration,
          [],
          {
            #indexes: indexes,
            #fieldOverrides: fieldOverrides,
          },
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> setIndexConfigurationFromJSON(String? json) =>
      (super.noSuchMethod(
        Invocation.method(
          #setIndexConfigurationFromJSON,
          [json],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}

/// A class which mocks [CollectionReference].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockCollectionReference<T extends Object?> extends _i1.Mock
    implements _i4.CollectionReference<T> {
  MockCollectionReference() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: '',
      ) as String);
  @override
  String get path => (super.noSuchMethod(
        Invocation.getter(#path),
        returnValue: '',
      ) as String);
  @override
  _i4.FirebaseFirestore get firestore => (super.noSuchMethod(
        Invocation.getter(#firestore),
        returnValue: _FakeFirebaseFirestore_10(
          this,
          Invocation.getter(#firestore),
        ),
      ) as _i4.FirebaseFirestore);
  @override
  Map<String, dynamic> get parameters => (super.noSuchMethod(
        Invocation.getter(#parameters),
        returnValue: <String, dynamic>{},
      ) as Map<String, dynamic>);
  @override
  _i5.Future<_i4.DocumentReference<T>> add(T? data) => (super.noSuchMethod(
        Invocation.method(
          #add,
          [data],
        ),
        returnValue: _i5.Future<_i4.DocumentReference<T>>.value(
            _FakeDocumentReference_8<T>(
          this,
          Invocation.method(
            #add,
            [data],
          ),
        )),
      ) as _i5.Future<_i4.DocumentReference<T>>);
  @override
  _i4.DocumentReference<T> doc([String? path]) => (super.noSuchMethod(
        Invocation.method(
          #doc,
          [path],
        ),
        returnValue: _FakeDocumentReference_8<T>(
          this,
          Invocation.method(
            #doc,
            [path],
          ),
        ),
      ) as _i4.DocumentReference<T>);
  @override
  _i4.CollectionReference<R> withConverter<R extends Object?>({
    required _i4.FromFirestore<R>? fromFirestore,
    required _i4.ToFirestore<R>? toFirestore,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #withConverter,
          [],
          {
            #fromFirestore: fromFirestore,
            #toFirestore: toFirestore,
          },
        ),
        returnValue: _FakeCollectionReference_3<R>(
          this,
          Invocation.method(
            #withConverter,
            [],
            {
              #fromFirestore: fromFirestore,
              #toFirestore: toFirestore,
            },
          ),
        ),
      ) as _i4.CollectionReference<R>);
  @override
  _i4.Query<T> endAtDocument(_i4.DocumentSnapshot<Object?>? documentSnapshot) =>
      (super.noSuchMethod(
        Invocation.method(
          #endAtDocument,
          [documentSnapshot],
        ),
        returnValue: _FakeQuery_7<T>(
          this,
          Invocation.method(
            #endAtDocument,
            [documentSnapshot],
          ),
        ),
      ) as _i4.Query<T>);
  @override
  _i4.Query<T> endAt(Iterable<Object?>? values) => (super.noSuchMethod(
        Invocation.method(
          #endAt,
          [values],
        ),
        returnValue: _FakeQuery_7<T>(
          this,
          Invocation.method(
            #endAt,
            [values],
          ),
        ),
      ) as _i4.Query<T>);
  @override
  _i4.Query<T> endBeforeDocument(
          _i4.DocumentSnapshot<Object?>? documentSnapshot) =>
      (super.noSuchMethod(
        Invocation.method(
          #endBeforeDocument,
          [documentSnapshot],
        ),
        returnValue: _FakeQuery_7<T>(
          this,
          Invocation.method(
            #endBeforeDocument,
            [documentSnapshot],
          ),
        ),
      ) as _i4.Query<T>);
  @override
  _i4.Query<T> endBefore(Iterable<Object?>? values) => (super.noSuchMethod(
        Invocation.method(
          #endBefore,
          [values],
        ),
        returnValue: _FakeQuery_7<T>(
          this,
          Invocation.method(
            #endBefore,
            [values],
          ),
        ),
      ) as _i4.Query<T>);
  @override
  _i5.Future<_i4.QuerySnapshot<T>> get([_i4.GetOptions? options]) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [options],
        ),
        returnValue:
            _i5.Future<_i4.QuerySnapshot<T>>.value(_FakeQuerySnapshot_6<T>(
          this,
          Invocation.method(
            #get,
            [options],
          ),
        )),
      ) as _i5.Future<_i4.QuerySnapshot<T>>);
  @override
  _i4.Query<T> limit(int? limit) => (super.noSuchMethod(
        Invocation.method(
          #limit,
          [limit],
        ),
        returnValue: _FakeQuery_7<T>(
          this,
          Invocation.method(
            #limit,
            [limit],
          ),
        ),
      ) as _i4.Query<T>);
  @override
  _i4.Query<T> limitToLast(int? limit) => (super.noSuchMethod(
        Invocation.method(
          #limitToLast,
          [limit],
        ),
        returnValue: _FakeQuery_7<T>(
          this,
          Invocation.method(
            #limitToLast,
            [limit],
          ),
        ),
      ) as _i4.Query<T>);
  @override
  _i5.Stream<_i4.QuerySnapshot<T>> snapshots(
          {bool? includeMetadataChanges = false}) =>
      (super.noSuchMethod(
        Invocation.method(
          #snapshots,
          [],
          {#includeMetadataChanges: includeMetadataChanges},
        ),
        returnValue: _i5.Stream<_i4.QuerySnapshot<T>>.empty(),
      ) as _i5.Stream<_i4.QuerySnapshot<T>>);
  @override
  _i4.Query<T> orderBy(
    Object? field, {
    bool? descending = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #orderBy,
          [field],
          {#descending: descending},
        ),
        returnValue: _FakeQuery_7<T>(
          this,
          Invocation.method(
            #orderBy,
            [field],
            {#descending: descending},
          ),
        ),
      ) as _i4.Query<T>);
  @override
  _i4.Query<T> startAfterDocument(
          _i4.DocumentSnapshot<Object?>? documentSnapshot) =>
      (super.noSuchMethod(
        Invocation.method(
          #startAfterDocument,
          [documentSnapshot],
        ),
        returnValue: _FakeQuery_7<T>(
          this,
          Invocation.method(
            #startAfterDocument,
            [documentSnapshot],
          ),
        ),
      ) as _i4.Query<T>);
  @override
  _i4.Query<T> startAfter(Iterable<Object?>? values) => (super.noSuchMethod(
        Invocation.method(
          #startAfter,
          [values],
        ),
        returnValue: _FakeQuery_7<T>(
          this,
          Invocation.method(
            #startAfter,
            [values],
          ),
        ),
      ) as _i4.Query<T>);
  @override
  _i4.Query<T> startAtDocument(
          _i4.DocumentSnapshot<Object?>? documentSnapshot) =>
      (super.noSuchMethod(
        Invocation.method(
          #startAtDocument,
          [documentSnapshot],
        ),
        returnValue: _FakeQuery_7<T>(
          this,
          Invocation.method(
            #startAtDocument,
            [documentSnapshot],
          ),
        ),
      ) as _i4.Query<T>);
  @override
  _i4.Query<T> startAt(Iterable<Object?>? values) => (super.noSuchMethod(
        Invocation.method(
          #startAt,
          [values],
        ),
        returnValue: _FakeQuery_7<T>(
          this,
          Invocation.method(
            #startAt,
            [values],
          ),
        ),
      ) as _i4.Query<T>);
  @override
  _i4.Query<T> where(
    Object? field, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    Iterable<Object?>? arrayContainsAny,
    Iterable<Object?>? whereIn,
    Iterable<Object?>? whereNotIn,
    bool? isNull,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #where,
          [field],
          {
            #isEqualTo: isEqualTo,
            #isNotEqualTo: isNotEqualTo,
            #isLessThan: isLessThan,
            #isLessThanOrEqualTo: isLessThanOrEqualTo,
            #isGreaterThan: isGreaterThan,
            #isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
            #arrayContains: arrayContains,
            #arrayContainsAny: arrayContainsAny,
            #whereIn: whereIn,
            #whereNotIn: whereNotIn,
            #isNull: isNull,
          },
        ),
        returnValue: _FakeQuery_7<T>(
          this,
          Invocation.method(
            #where,
            [field],
            {
              #isEqualTo: isEqualTo,
              #isNotEqualTo: isNotEqualTo,
              #isLessThan: isLessThan,
              #isLessThanOrEqualTo: isLessThanOrEqualTo,
              #isGreaterThan: isGreaterThan,
              #isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
              #arrayContains: arrayContains,
              #arrayContainsAny: arrayContainsAny,
              #whereIn: whereIn,
              #whereNotIn: whereNotIn,
              #isNull: isNull,
            },
          ),
        ),
      ) as _i4.Query<T>);
  @override
  _i4.AggregateQuery count() => (super.noSuchMethod(
        Invocation.method(
          #count,
          [],
        ),
        returnValue: _FakeAggregateQuery_11(
          this,
          Invocation.method(
            #count,
            [],
          ),
        ),
      ) as _i4.AggregateQuery);
}

/// A class which mocks [DocumentReference].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockDocumentReference<T extends Object?> extends _i1.Mock
    implements _i4.DocumentReference<T> {
  MockDocumentReference() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.FirebaseFirestore get firestore => (super.noSuchMethod(
        Invocation.getter(#firestore),
        returnValue: _FakeFirebaseFirestore_10(
          this,
          Invocation.getter(#firestore),
        ),
      ) as _i4.FirebaseFirestore);
  @override
  String get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: '',
      ) as String);
  @override
  _i4.CollectionReference<T> get parent => (super.noSuchMethod(
        Invocation.getter(#parent),
        returnValue: _FakeCollectionReference_3<T>(
          this,
          Invocation.getter(#parent),
        ),
      ) as _i4.CollectionReference<T>);
  @override
  String get path => (super.noSuchMethod(
        Invocation.getter(#path),
        returnValue: '',
      ) as String);
  @override
  _i4.CollectionReference<Map<String, dynamic>> collection(
          String? collectionPath) =>
      (super.noSuchMethod(
        Invocation.method(
          #collection,
          [collectionPath],
        ),
        returnValue: _FakeCollectionReference_3<Map<String, dynamic>>(
          this,
          Invocation.method(
            #collection,
            [collectionPath],
          ),
        ),
      ) as _i4.CollectionReference<Map<String, dynamic>>);
  @override
  _i5.Future<void> delete() => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<void> update(Map<Object, Object?>? data) => (super.noSuchMethod(
        Invocation.method(
          #update,
          [data],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<_i4.DocumentSnapshot<T>> get([_i4.GetOptions? options]) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [options],
        ),
        returnValue: _i5.Future<_i4.DocumentSnapshot<T>>.value(
            _FakeDocumentSnapshot_12<T>(
          this,
          Invocation.method(
            #get,
            [options],
          ),
        )),
      ) as _i5.Future<_i4.DocumentSnapshot<T>>);
  @override
  _i5.Stream<_i4.DocumentSnapshot<T>> snapshots(
          {bool? includeMetadataChanges = false}) =>
      (super.noSuchMethod(
        Invocation.method(
          #snapshots,
          [],
          {#includeMetadataChanges: includeMetadataChanges},
        ),
        returnValue: _i5.Stream<_i4.DocumentSnapshot<T>>.empty(),
      ) as _i5.Stream<_i4.DocumentSnapshot<T>>);
  @override
  _i5.Future<void> set(
    T? data, [
    _i4.SetOptions? options,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #set,
          [
            data,
            options,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i4.DocumentReference<R> withConverter<R>({
    required _i4.FromFirestore<R>? fromFirestore,
    required _i4.ToFirestore<R>? toFirestore,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #withConverter,
          [],
          {
            #fromFirestore: fromFirestore,
            #toFirestore: toFirestore,
          },
        ),
        returnValue: _FakeDocumentReference_8<R>(
          this,
          Invocation.method(
            #withConverter,
            [],
            {
              #fromFirestore: fromFirestore,
              #toFirestore: toFirestore,
            },
          ),
        ),
      ) as _i4.DocumentReference<R>);
}
