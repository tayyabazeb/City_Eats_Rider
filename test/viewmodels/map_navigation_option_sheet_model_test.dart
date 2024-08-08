import 'package:flutter_test/flutter_test.dart';
import 'package:rider/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('MapNavigationOptionSheetModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
