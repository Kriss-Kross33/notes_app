// // Expected: [
// //             SignupState:SignupState(FormzInput<String, EmailValidationError>.pure(value: , isValid: false, error: EmailValidationError.invalid), FormzInput<String, PasswordValidationError>.dirty(value: invalid, isValid: false, error: PasswordValidationError.invalid), FormzInput<String, ConfirmPasswordValidationError>.dirty(value: , isValid: false, error: ConfirmPasswordValidationError.invalid), FormzSubmissionStatus.initial, null, false)
// //           ]
// //   Actual: [
// //             SignupState:SignupState(FormzInput<String, EmailValidationError>.pure(value: , isValid: false, error: EmailValidationError.invalid), FormzInput<String, PasswordValidationError>.dirty(value: invalid, isValid: false, error: PasswordValidationError.invalid), FormzInput<String, ConfirmPasswordValidationError>.pure(value: , isValid: true, error: null), FormzSubmissionStatus.initial, null, false)
// //           ]


// SignupState:SignupState(FormzInput<String, EmailValidationError>.dirty(value: mytest@gmail.com, isValid: true, error: null), FormzInput<String, PasswordValidationError>.pure(value: , isValid: false, error: PasswordValidationError.invalid), FormzInput<String, ConfirmedPasswordValidationError>.dirty(value: pAssw0rd@, isValid: true, error: null), FormzSubmissionStatus.initial, null, false),
//             SignupState:SignupState(FormzInput<String, EmailValidationError>.dirty(value: mytest@gmail.com, isValid: true, error: null), FormzInput<String, PasswordValidationError>.dirty(value: pAssw0rd@, isValid: true, error: null), FormzInput<String, ConfirmedPasswordValidationError>.dirty(value: pAssw0rd@, isValid: true, error: null), FormzSubmissionStatus.initial, null, true)
//           ]
//   Actual: [
//             SignupState:SignupState(FormzInput<String, EmailValidationError>.dirty(value: mytest@gmail.com, isValid: true, error: null), FormzInput<String, PasswordValidationError>.pure(value: , isValid: false, error: PasswordValidationError.invalid), FormzInput<String, ConfirmedPasswordValidationError>.dirty(value: pAssw0rd@, isValid: false, error: ConfirmedPasswordValidationError.invalid), FormzSubmissionStatus.initial, null, false)