import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:formz_input/formz_input.dart';
import 'package:notes_app/src/features/settings/blocs/signup_cubit/signup_cubit.dart';

void main() {
  const email = Email.dirty('email');
  const password = Password.dirty('password');
  const confirmPassword = ConfirmPassword.dirty(
    password: 'password',
    value: 'password',
  );

  late SignupState signupState;

  setUp(() {
    signupState = const SignupState();
  });

  group('SignupState', () {
    test('supports value comparisons', () {
      expect(const SignupState(), const SignupState());
    });

    test('returns same object when no properties are passed', () {
      expect(signupState.copyWith(), signupState);
    });

    test('returns object with updated status when status is passed', () {
      expect(
        signupState.copyWith(status: FormzSubmissionStatus.initial),
        signupState,
      );
    });

    test('returns object with updated email when email is passed', () {
      expect(
        signupState.copyWith(email: email),
        const SignupState(email: email),
      );
    });

    test('returns object with updated email when email is passed', () {
      expect(
        signupState.copyWith(email: email),
        const SignupState(email: email),
      );
    });

    test('returns object with updated password when password is passed', () {
      expect(
        signupState.copyWith(password: password),
        const SignupState(password: password),
      );
    });

    test(
        'returns object with updated confirmedPassword'
        ' when confirmedPassword is passed', () {
      expect(
        signupState.copyWith(confirmPassword: confirmPassword),
        const SignupState(confirmPassword: confirmPassword),
      );
    });
  });
}
