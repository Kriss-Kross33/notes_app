// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_app/src/common/common.dart';

import 'authentication_bloc_test.mocks.dart';

@GenerateMocks(
  [AuthenticationRepository, UserModel, firebase_auth.UserCredential],
)
void main() {
  group('AuthenticationBloc', () {
    late MockAuthenticationRepository mockAuthenticationRepository;
    late MockUserCredential mockUserCredential;
    setUp(() {
      mockAuthenticationRepository = MockAuthenticationRepository();
      mockUserCredential = MockUserCredential();
      when(mockAuthenticationRepository.user).thenAnswer(
        (_) => Stream.empty(),
      );
    });

    test('initial state is unauthenticated when user is empty', () {
      expect(
        AuthenticationBloc(repository: mockAuthenticationRepository).state,
        AuthenticationState.unauthenticated(),
      );
    });

    group('UserChanged', () {
      blocTest<AuthenticationBloc, AuthenticationState>(
        'emits unauthenticated when user is empty',
        setUp: () {
          when(mockAuthenticationRepository.user).thenAnswer(
            (_) => Stream.value(UserModel.empty),
          );
        },
        build: () => AuthenticationBloc(
          repository: mockAuthenticationRepository,
        ),
        expect: () => [AuthenticationState.unauthenticated()],
      );
    });

    group('LogoutRequested', () {
      blocTest<AuthenticationBloc, AuthenticationState>(
        'invokes logOut',
        setUp: () {
          when(
            mockAuthenticationRepository.logout(),
          ).thenAnswer((_) async {});
          when(mockAuthenticationRepository.signInAnonymously())
              .thenAnswer((realInvocation) async => mockUserCredential);
        },
        build: () => AuthenticationBloc(
          repository: mockAuthenticationRepository,
        ),
        act: (bloc) => bloc.add(LogoutRequestedEvent()),
        verify: (_) {
          verify(mockAuthenticationRepository.logout()).called(1);
        },
      );
    });
  });
}
