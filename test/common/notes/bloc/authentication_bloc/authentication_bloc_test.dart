// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_app/src/common/common.dart';

import 'authentication_bloc_test.mocks.dart';

@GenerateMocks([AuthenticationRepository, UserModel])
void main() {
  group('AuthenticationBloc', () {
    final user = MockUserModel();
    late MockAuthenticationRepository mockAuthenticationRepository;

    setUp(() {
      mockAuthenticationRepository = MockAuthenticationRepository();
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
        'emits authenticated when user is not empty',
        setUp: () {
          when(user.isNotEmpty).thenReturn(true);
          when(mockAuthenticationRepository.user).thenAnswer(
            (_) => Stream.value(user),
          );
        },
        build: () => AuthenticationBloc(
          repository: mockAuthenticationRepository,
        ),
        seed: AuthenticationState.unauthenticated,
        expect: () => [AuthenticationState.authenticated(user: user)],
      );

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
