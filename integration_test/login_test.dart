import 'package:flutter_test/flutter_test.dart';
import 'package:imdb_sample/config/keys.dart';
import 'package:integration_test/integration_test.dart';
import 'package:patrol/patrol.dart';
import 'package:imdb_sample/main.dart' as app;

import 'config.dart';

void main() {

  patrolTest(
    'click to button login should navigate to main screen',
    config: patrolConfig,
    nativeAutomation: true, // run on native device
    ($) async {
      app.main();
      await $(K.loginButton).waitUntilVisible();
      await $(K.loginButton).tap();
      expect($(K.bottomNavigation), findsOneWidget);
    },
  );

  Future<void> addDelay(int ms) async {
    await Future<void>.delayed(Duration(milliseconds: ms));
  }

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('click to button login should navigate to main screen',
      (tester) async {
    app.main();
    await tester.pumpAndSettle();
    await addDelay(
        4000); // Patrol does not require this line because it will wait until timeout to find item
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(K.loginButton));
    await tester.pumpAndSettle();
    expect(find.byKey(K.bottomNavigation), findsOneWidget);
  });
}
