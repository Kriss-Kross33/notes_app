// Mocks generated by Mockito 5.4.2 from annotations
// in notes_app/test/features/settings/blocs/signin_cubit/signin_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:authentication_repository/src/authentication_repository.dart'
    as _i3;
import 'package:authentication_repository/src/models/user_model.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

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

/// A class which mocks [AuthenticationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationRepository extends _i1.Mock
    implements _i3.AuthenticationRepository {
  MockAuthenticationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<_i5.UserModel> get user => (super.noSuchMethod(
        Invocation.getter(#user),
        returnValue: _i4.Stream<_i5.UserModel>.empty(),
      ) as _i4.Stream<_i5.UserModel>);
  @override
  _i4.Future<void> loginWithEmailAndPassword({
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
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> signup({
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
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> convertUserWithEmail({
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
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> convertUserWithGmail(_i2.AuthCredential? credential) =>
      (super.noSuchMethod(
        Invocation.method(
          #convertUserWithGmail,
          [credential],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> loginWithGoogle() => (super.noSuchMethod(
        Invocation.method(
          #loginWithGoogle,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  bool isLoggedIn() => (super.noSuchMethod(
        Invocation.method(
          #isLoggedIn,
          [],
        ),
        returnValue: false,
      ) as bool);
  @override
  _i4.Future<_i2.UserCredential> signInAnonymously() => (super.noSuchMethod(
        Invocation.method(
          #signInAnonymously,
          [],
        ),
        returnValue: _i4.Future<_i2.UserCredential>.value(_FakeUserCredential_0(
          this,
          Invocation.method(
            #signInAnonymously,
            [],
          ),
        )),
      ) as _i4.Future<_i2.UserCredential>);
  @override
  _i4.Future<void> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
