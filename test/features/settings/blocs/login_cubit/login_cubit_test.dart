// ignore_for_file: prefer_const_constructors
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:formz_input/formz_input.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_app/src/features/settings/blocs/blocs.dart';

import 'login_cubit_test.mocks.dart';

@GenerateMocks([AuthenticationRepository])
void main() {
  const invalidEmailString = 'invalid';
  const invalidEmail = Email.dirty(invalidEmailString);

  const validEmailString = 'test@gmail.com';
  const validEmail = Email.dirty(validEmailString);

  const invalidPasswordString = 'invalid';
  const invalidPassword = Password.dirty(invalidPasswordString);

  const validPasswordString = 't0pS3cret1234';
  const validPassword = Password.dirty(validPasswordString);

  group('LoginCubit', () {
    late AuthenticationRepository mockAuthenticationRepository;

    setUp(() {
      mockAuthenticationRepository = MockAuthenticationRepository();
      when(
        mockAuthenticationRepository.loginWithGoogle(),
      ).thenAnswer((_) async {});

      when(
        mockAuthenticationRepository.loginWithEmailAndPassword(
          email: 's',
          password: 's',
        ),
      ).thenAnswer((_) async {});
    });

    test('initial state is LoginState', () {
      expect(
        LoginCubit(
          authenticationRepository: mockAuthenticationRepository,
        ).state,
        LoginState(),
      );
    });

    group('emailChanged', () {
      blocTest<LoginCubit, LoginState>(
        'emits [invalid] when email/password are invalid',
        build: () => LoginCubit(
          authenticationRepository: mockAuthenticationRepository,
        ),
        act: (cubit) => cubit.onEmailInput(invalidEmailString),
        expect: () => const <LoginState>[LoginState(email: invalidEmail)],
      );

      blocTest<LoginCubit, LoginState>(
        'emits [valid] when email/password are valid',
        build: () => LoginCubit(
          authenticationRepository: mockAuthenticationRepository,
        ),
        seed: () => LoginState(password: validPassword),
        act: (cubit) => cubit.onEmailInput(validEmailString),
        expect: () => const <LoginState>[
          LoginState(
            email: validEmail,
            password: validPassword,
            isValid: true,
          ),
        ],
      );
    });

    group('passwordChanged', () {
      blocTest<LoginCubit, LoginState>(
        'emits [invalid] when email/password are invalid',
        build: () => LoginCubit(
          authenticationRepository: mockAuthenticationRepository,
        ),
        act: (cubit) => cubit.onPasswordInput(invalidPasswordString),
        expect: () => const <LoginState>[LoginState(password: invalidPassword)],
      );

      blocTest<LoginCubit, LoginState>(
        'emits [valid] when email/password are valid',
        build: () => LoginCubit(
          authenticationRepository: mockAuthenticationRepository,
        ),
        seed: () => LoginState(email: validEmail),
        act: (cubit) => cubit.onPasswordInput(validPasswordString),
        expect: () => const <LoginState>[
          LoginState(
            email: validEmail,
            password: validPassword,
            isValid: true,
          ),
        ],
      );
    });

    group('onLoginButtonPressed', () {
      blocTest<LoginCubit, LoginState>(
        'does nothing when status is not validated',
        build: () => LoginCubit(
          authenticationRepository: mockAuthenticationRepository,
        ),
        act: (cubit) => cubit.onLoginButtonPressed(),
        expect: () => const <LoginState>[],
      );

      blocTest<LoginCubit, LoginState>(
        'calls loginWithEmailAndPassword with correct email/password',
        build: () => LoginCubit(
          authenticationRepository: mockAuthenticationRepository,
        ),
        seed: () => LoginState(
          email: validEmail,
          password: validPassword,
          isValid: true,
        ),
        act: (cubit) => cubit.onLoginButtonPressed(),
        verify: (_) {
          verify(
            mockAuthenticationRepository.loginWithEmailAndPassword(
              email: validEmailString,
              password: validPasswordString,
            ),
          ).called(1);
        },
      );

      blocTest<LoginCubit, LoginState>(
        'emits [submissionInProgress, submissionSuccess] '
        'when loginWithEmailAndPassword succeeds',
        build: () => LoginCubit(
          authenticationRepository: mockAuthenticationRepository,
        ),
        seed: () => LoginState(
          email: validEmail,
          password: validPassword,
          isValid: true,
        ),
        act: (cubit) => cubit.onLoginButtonPressed(),
        expect: () => const <LoginState>[
          LoginState(
            status: FormzSubmissionStatus.inProgress,
            email: validEmail,
            password: validPassword,
            isValid: true,
          ),
          LoginState(
            status: FormzSubmissionStatus.success,
            email: validEmail,
            password: validPassword,
            isValid: true,
          )
        ],
      );

      blocTest<LoginCubit, LoginState>(
        'emits [submissionInProgress, submissionFailure] '
        'when loginWithEmailAndPassword fails '
        'due to loginWithEmailAndPasswordFailure',
        setUp: () {
          when(
            mockAuthenticationRepository.loginWithEmailAndPassword(
              email: validEmailString,
              password: validPasswordString,
            ),
          ).thenThrow(LoginWithEmailAndPasswordFailure(errorMessage: 'Error'));
        },
        build: () => LoginCubit(
          authenticationRepository: mockAuthenticationRepository,
        ),
        seed: () => LoginState(
          email: validEmail,
          password: validPassword,
          isValid: true,
        ),
        act: (cubit) => cubit.onLoginButtonPressed(),
        expect: () => const <LoginState>[
          LoginState(
            status: FormzSubmissionStatus.inProgress,
            email: validEmail,
            password: validPassword,
            isValid: true,
          ),
          LoginState(
            status: FormzSubmissionStatus.failure,
            errorMessage: 'Error',
            email: validEmail,
            password: validPassword,
            isValid: true,
          )
        ],
      );
    });

    group('loginWithGoogle', () {
      blocTest<LoginCubit, LoginState>(
        'calls loginWithGoogle',
        build: () => LoginCubit(
          authenticationRepository: mockAuthenticationRepository,
        ),
        act: (cubit) => cubit.onLoginWithGoogleButtonPressed(),
        verify: (_) {
          verify(
            mockAuthenticationRepository.loginWithGoogle(),
          ).called(1);
        },
      );

      blocTest<LoginCubit, LoginState>(
        'emits [inProgress, success] '
        'when loginWithGoogle succeeds',
        build: () => LoginCubit(
          authenticationRepository: mockAuthenticationRepository,
        ),
        act: (cubit) => cubit.onLoginWithGoogleButtonPressed(),
        expect: () => const <LoginState>[
          LoginState(status: FormzSubmissionStatus.inProgress),
          LoginState(status: FormzSubmissionStatus.success)
        ],
      );
    });
  });
}
