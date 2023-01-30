import 'package:flutter_test/flutter_test.dart';
import 'package:imdb_sample/config/keys.dart';
import 'package:imdb_sample/data/repositories/auth_repository.dart';
import 'package:imdb_sample/di/injection.dart';
import 'package:integration_test/integration_test.dart';
import 'package:patrol/patrol.dart';
import 'package:imdb_sample/main.dart' as app;

import 'config.dart';

void main() {
  patrolTest(
    'clicking button login should navigate to main screen',
    config: patrolConfig,
    nativeAutomation: true,
    ($) async {
      await app.main();
      await $.pumpAndSettle();
      final authRepo = getIt<IAuthRepository>() as AuthRepository;
      if (!authRepo.isUserLoggedIn()) {
        await $(K.loginButton).tap();
        expect($(K.bottomNavigation), findsOneWidget);
      }
    },
  );

  // IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // testWidgets('clicking button login should navigate to main screen',
  //     (tester) async {
  //   await app.main();
  //   await tester.pumpAndSettle(const Duration(
  //       milliseconds:
  //           5000)); // Patrol does not require this line because it will wait until timeout to find item
  //   final authRepo = getIt<IAuthRepository>() as AuthRepository;
  //   if (!authRepo.isUserLoggedIn()) {
  //     await tester.tap(find.byKey(K.loginButton));
  //     await tester.pumpAndSettle();
  //     expect(find.byKey(K.bottomNavigation), findsOneWidget);
  //   }
  // });
}
