// ignore_for_file: prefer_const_constructors
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:formz_input/formz_input.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_app/src/features/settings/blocs/signup_cubit/signup_cubit.dart';

import 'signin_cubit_test.mocks.dart';

@GenerateMocks([AuthenticationRepository])
void main() {
  const invalidEmailString = 'invalid';
  const invalidEmail = Email.dirty(invalidEmailString);

  const validEmailString = 'krisskross@gmail.com';
  const validEmail = Email.dirty(validEmailString);

  const invalidPasswordString = 'invalid';
  const invalidPassword = Password.dirty(invalidPasswordString);

  const validPasswordString = 'pAssw0rd@';
  const validPassword = Password.dirty(validPasswordString);

  const invalidConfirmPasswordString = 'invalid';
  const invalidConfirmedPassword = ConfirmPassword.dirty(
    password: validPasswordString,
    value: invalidConfirmPasswordString,
  );

  const validConfirmedPasswordString = 'pAssw0rd@';
  const validConfirmedPassword = ConfirmPassword.dirty(
    password: validPasswordString,
    value: validConfirmedPasswordString,
  );

  group('SignupCubit', () {
    late MockAuthenticationRepository mockAuthenticationRepository;

    setUp(() {
      mockAuthenticationRepository = MockAuthenticationRepository();

      when(
        mockAuthenticationRepository.signup(
          email: anyNamed('email'),
          password: anyNamed('password'),
        ),
      ).thenAnswer((_) async {});
    });

    test('initial state is SignupState', () {
      expect(
        SignupCubit(authenticationRepository: mockAuthenticationRepository)
            .state,
        SignupState(),
      );
    });

    group('emailChanged', () {
      blocTest<SignupCubit, SignupState>(
        'emits [invalid] when email/password/confirmPassword are invalid',
        build: () =>
            SignupCubit(authenticationRepository: mockAuthenticationRepository),
        act: (cubit) => cubit.onEmailInput(invalidEmailString),
        expect: () => const <SignupState>[SignupState(email: invalidEmail)],
      );

      blocTest<SignupCubit, SignupState>(
        'emits [valid] when email/password/confirmPassword are valid',
        build: () =>
            SignupCubit(authenticationRepository: mockAuthenticationRepository),
        seed: () => SignupState(
          password: validPassword,
          confirmPassword: validConfirmedPassword,
        ),
        act: (cubit) => cubit.onEmailInput(validEmailString),
        expect: () => const <SignupState>[
          SignupState(
            email: validEmail,
            password: validPassword,
            confirmPassword: validConfirmedPassword,
            isValid: true,
          ),
        ],
      );
    });

    group('passwordChanged', () {
      blocTest<SignupCubit, SignupState>(
        'emits [invalid] when email/password/confirmPassword are invalid',
        build: () =>
            SignupCubit(authenticationRepository: mockAuthenticationRepository),
        act: (cubit) => cubit.onPasswordInput(invalidPasswordString),
        expect: () => const <SignupState>[
          SignupState(
            confirmPassword: ConfirmPassword.dirty(
              password: invalidPasswordString,
            ),
            password: invalidPassword,
          ),
        ],
      );

      blocTest<SignupCubit, SignupState>(
        'emits [valid] when email/password/confirmPassword are valid',
        build: () => SignupCubit(
          authenticationRepository: mockAuthenticationRepository,
        ),
        seed: () => SignupState(
          email: validEmail,
          confirmPassword: validConfirmedPassword,
        ),
        act: (cubit) => cubit.onPasswordInput(validPasswordString),
        expect: () => const <SignupState>[
          SignupState(
            email: validEmail,
            password: validPassword,
            confirmPassword: validConfirmedPassword,
            isValid: true,
          ),
        ],
      );

      group('confirmedPasswordChanged', () {
        blocTest<SignupCubit, SignupState>(
          'emits [invalid] when email/password/confirmedPassword are invalid',
          build: () => SignupCubit(
            authenticationRepository: mockAuthenticationRepository,
          ),
          act: (cubit) {
            cubit.onConfirmPasswordInput(invalidConfirmPasswordString);
          },
          expect: () => const <SignupState>[
            SignupState(confirmPassword: invalidConfirmedPassword),
          ],
        );

        blocTest<SignupCubit, SignupState>(
          'emits [valid] when email/password/confirmedPassword are valid',
          build: () => SignupCubit(
            authenticationRepository: mockAuthenticationRepository,
          ),
          seed: () => SignupState(email: validEmail, password: validPassword),
          act: (cubit) => cubit.onConfirmPasswordInput(
            validConfirmedPasswordString,
          ),
          expect: () => const <SignupState>[
            SignupState(
              email: validEmail,
              password: validPassword,
              confirmPassword: validConfirmedPassword,
              isValid: true,
            ),
          ],
        );

        blocTest<SignupCubit, SignupState>(
          'emits [valid] when onConfirmPasswordInput is called first and then '
          'passwordChanged is called',
          build: () => SignupCubit(
            authenticationRepository: mockAuthenticationRepository,
          ),
          seed: () => SignupState(
            email: validEmail,
          ),
          act: (cubit) => cubit
            ..onConfirmPasswordInput(validConfirmedPasswordString)
            ..onPasswordInput(validPasswordString),
          expect: () => const <SignupState>[
            SignupState(
              email: validEmail,
              confirmPassword: validConfirmedPassword,
            ),
            SignupState(
              email: validEmail,
              password: validPassword,
              confirmPassword: validConfirmedPassword,
              isValid: true,
            ),
          ],
        );
      });

      group('onConfirmPasswordInput', () {
        blocTest<SignupCubit, SignupState>(
          'emits [invalid] when email/password/confirmPassword are invalid',
          build: () => SignupCubit(
            authenticationRepository: mockAuthenticationRepository,
          ),
          act: (cubit) {
            cubit.onConfirmPasswordInput(invalidConfirmPasswordString);
          },
          expect: () => const <SignupState>[
            SignupState(confirmPassword: invalidConfirmedPassword),
          ],
        );

        blocTest<SignupCubit, SignupState>(
          'emits [valid] when email/password/confirmPassword are valid',
          build: () => SignupCubit(
            authenticationRepository: mockAuthenticationRepository,
          ),
          seed: () => SignupState(email: validEmail, password: validPassword),
          act: (cubit) => cubit.onConfirmPasswordInput(
            validConfirmedPasswordString,
          ),
          expect: () => const <SignupState>[
            SignupState(
              email: validEmail,
              password: validPassword,
              confirmPassword: validConfirmedPassword,
              isValid: true,
            ),
          ],
        );

        blocTest<SignupCubit, SignupState>(
          'emits [valid] when passwordChanged is called first and then '
          'onConfirmPasswordInput is called',
          build: () => SignupCubit(
            authenticationRepository: mockAuthenticationRepository,
          ),
          seed: () => SignupState(email: validEmail),
          act: (cubit) => cubit
            ..onPasswordInput(validPasswordString)
            ..onConfirmPasswordInput(validConfirmedPasswordString),
          expect: () => const <SignupState>[
            SignupState(
              email: validEmail,
              password: validPassword,
              confirmPassword: ConfirmPassword.dirty(
                password: validPasswordString,
              ),
            ),
            SignupState(
              email: validEmail,
              password: validPassword,
              confirmPassword: validConfirmedPassword,
              isValid: true,
            ),
          ],
        );
      });

      group('onSignupButtonPressed', () {
        blocTest<SignupCubit, SignupState>(
          'does nothing when status is not validated',
          build: () => SignupCubit(
            authenticationRepository: mockAuthenticationRepository,
          ),
          act: (cubit) => cubit.onSignupButtonPressed(),
          expect: () => const <SignupState>[],
        );

        blocTest<SignupCubit, SignupState>(
          'calls signUp with correct email/password/confirmPassword',
          build: () => SignupCubit(
            authenticationRepository: mockAuthenticationRepository,
          ),
          seed: () => SignupState(
            email: validEmail,
            password: validPassword,
            confirmPassword: validConfirmedPassword,
            isValid: true,
          ),
          act: (cubit) => cubit.onSignupButtonPressed(),
          verify: (_) {
            verify(
              mockAuthenticationRepository.signup(
                email: validEmailString,
                password: validPasswordString,
              ),
            ).called(1);
          },
        );

        blocTest<SignupCubit, SignupState>(
          'emits [inProgress, success] '
          'when signUp succeeds',
          build: () => SignupCubit(
            authenticationRepository: mockAuthenticationRepository,
          ),
          seed: () => SignupState(
            email: validEmail,
            password: validPassword,
            confirmPassword: validConfirmedPassword,
            isValid: true,
          ),
          act: (cubit) => cubit.onSignupButtonPressed(),
          expect: () => const <SignupState>[
            SignupState(
              status: FormzSubmissionStatus.inProgress,
              email: validEmail,
              password: validPassword,
              confirmPassword: validConfirmedPassword,
              isValid: true,
            ),
            SignupState(
              status: FormzSubmissionStatus.success,
              email: validEmail,
              password: validPassword,
              confirmPassword: validConfirmedPassword,
              isValid: true,
            )
          ],
        );

        blocTest<SignupCubit, SignupState>(
          'emits [inProgress, failure] '
          'when signUp fails due to SignUpWithEmailAndPasswordFailure',
          setUp: () {
            when(
              mockAuthenticationRepository.signup(
                email: anyNamed('email'),
                password: anyNamed('password'),
              ),
            ).thenThrow(SignupWithEmailAndPasswordError(errorMessage: 'error'));
          },
          build: () => SignupCubit(
            authenticationRepository: mockAuthenticationRepository,
          ),
          seed: () => SignupState(
            email: validEmail,
            password: validPassword,
            confirmPassword: validConfirmedPassword,
            isValid: true,
          ),
          act: (cubit) => cubit.onSignupButtonPressed(),
          expect: () => const <SignupState>[
            SignupState(
              status: FormzSubmissionStatus.inProgress,
              email: validEmail,
              password: validPassword,
              confirmPassword: validConfirmedPassword,
              isValid: true,
            ),
            SignupState(
              status: FormzSubmissionStatus.failure,
              errorMessage: 'error',
              email: validEmail,
              password: validPassword,
              confirmPassword: validConfirmedPassword,
              isValid: true,
            )
          ],
        );

        // blocTest<SignupCubit, SignupState>(
        //   'emits [inProgress, failure] '
        //   'when signUp fails due to generic exception',
        //   setUp: () {
        //     when(
        //       mockAuthenticationRepository.signup(
        //         email: anyNamed('email'),
        //         password: anyNamed('password'),
        //       ),
        //     ).thenThrow(SignupWithEmailAndPasswordError(errorMessage: 'error'));
        //   },
        //   build: () => SignupCubit(
        //     authenticationRepository: mockAuthenticationRepository,
        //   ),
        //   seed: () => SignupState(
        //     email: validEmail,
        //     password: validPassword,
        //     confirmPassword: validConfirmedPassword,
        //     isValid: true,
        //   ),
        //   act: (cubit) => cubit.onSignupButtonPressed(),
        //   expect: () => const <SignupState>[
        //     SignupState(
        //       status: FormzSubmissionStatus.inProgress,
        //       email: validEmail,
        //       password: validPassword,
        //       confirmPassword: validConfirmedPassword,
        //       isValid: true,
        //     ),
        //     SignupState(
        //       status: FormzSubmissionStatus.failure,
        //       email: validEmail,
        //       password: validPassword,
        //       confirmPassword: validConfirmedPassword,
        //       isValid: true,
        //     )
        //   ],
        // );
      });
    });
  });
}
