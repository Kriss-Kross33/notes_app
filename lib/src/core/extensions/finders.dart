import 'package:flutter_test/flutter_test.dart';

extension ExtraFinders on CommonFinders {
  Finder bySpecificType<T>() => find.byType(T);
}
