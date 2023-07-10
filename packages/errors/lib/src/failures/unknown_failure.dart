// ignore_for_file: overridden_fields

import 'package:errors/src/errors.dart';

/// {@templaten unknown_platform_failure}
/// Failure which occurs when the error is unknown
/// {@endtemplate}
class UnknownFailure extends Failure {
  /// {@macro unknown_platform_failure}
  const UnknownFailure({
    required this.errorMessage,
  }) : super(
          errorMessage: errorMessage,
        );
  @override
  final String errorMessage;

  @override
  List<Object?> get props => [
        errorMessage,
      ];
}
