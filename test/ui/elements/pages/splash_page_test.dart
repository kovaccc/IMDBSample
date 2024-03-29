import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imdb_sample/config/keys.dart';

import 'package:imdb_sample/main.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest(
    'verify there is icon on splash screen',
    ($) async {
      await $.pumpWidgetAndSettle(const ProviderScope(child: MyApp()));
      expect($(K.qSplashLogo), findsOneWidget);
    },
  );

  patrolTest(
    'throws exception when text is not visible on splash screen',
    ($) async {
      await $.pumpWidgetAndSettle(const ProviderScope(child: MyApp()));

      await expectLater(
        () => $('non-visible text').waitUntilVisible(),
        throwsA(isA<WaitUntilVisibleTimeoutException>()),
      );
    },
    config: const PatrolTesterConfig(
      visibleTimeout: Duration(milliseconds: 300),
    ),
  );

  testWidgets(
    'verify there is icon on splash screen',
    (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MyApp()));
      await tester.pumpAndSettle();
      expect(find.byKey(K.qSplashLogo), findsOneWidget);
    },
  );
}
