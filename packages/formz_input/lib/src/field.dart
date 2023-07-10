import 'package:formz/formz.dart';

/// Generic input validation error
enum FieldValidationError {
  /// Generic invalid error
  invalid,
}

/// {@template field}
/// Form input for Genric fields
/// {@endtemplate}
class Field extends FormzInput<String, FieldValidationError> {
  /// {@macro field}
  const Field.pure() : super.pure('');

  const Field.dirty([super.value = '']) : super.dirty();

  @override
  FieldValidationError? validator(String? value) {
    if (value == null) value = '';
    if (value.isNotEmpty) return null;
    return FieldValidationError.invalid;
  }
}
