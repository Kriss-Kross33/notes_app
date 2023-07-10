import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:formz_input/formz_input.dart';
import 'package:notes_app/src/features/settings/blocs/login_cubit/login_cubit.dart';

void main() {
  late LoginState loginState;
  const email = Email.dirty('email');
  const password = Password.dirty('password');

  setUp(() {
    loginState = const LoginState();
  });

  group('LoginState', () {
    test('supports value comparisons', () {
      expect(loginState, loginState);
    });

    test('returns same object when no properties are passed', () {
      expect(loginState.copyWith(), loginState);
    });

    test('returns object with updated status when status is passed', () {
      expect(
        loginState.copyWith(status: FormzSubmissionStatus.initial),
        loginState,
      );
    });

    test('returns object with updated email when email is passed', () {
      expect(
        loginState.copyWith(email: email),
        const LoginState(email: email),
      );
    });

    test('returns object with updated password when password is passed', () {
      expect(
        loginState.copyWith(password: password),
        const LoginState(password: password),
      );
    });
  });
}
