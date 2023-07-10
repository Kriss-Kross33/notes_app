import 'package:errors/src/models/models.dart';

/// {@template cache_exception}
///
/// {@endtemplate}
class EmptyCacheException implements Exception {
  /// Cache error message.
  final String errorMessage;

  ///

  final ErrorDetails? errorDetails;

  /// {@macro cache_exception}
  const EmptyCacheException({
    required this.errorMessage,
    this.errorDetails,
  });
}
