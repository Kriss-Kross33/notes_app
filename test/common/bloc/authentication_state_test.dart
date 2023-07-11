// ignore_for_file: prefer_const_constructors
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:notes_app/src/common/common.dart';

import 'authentication_state_test.mocks.dart';

@GenerateMocks([UserModel])
void main() {
  late MockUserModel mockUser;

  setUp(() {
    mockUser = MockUserModel();
  });
  group('AuthenticationState', () {
    group('unauthenticated', () {
      test('has correct status', () {
        final state = AuthenticationState.unauthenticated();
        expect(state.status, AuthenticationStatus.unauthenticated);
        expect(state.user, UserModel.empty);
      });
    });

    group('authenticated', () {
      test('has correct status', () {
        final state = AuthenticationState.authenticated(user: mockUser);
        expect(state.status, AuthenticationStatus.authenticated);
        expect(state.user, mockUser);
      });
    });
  });
}
