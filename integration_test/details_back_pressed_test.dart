import 'package:flutter/foundation.dart';
import 'package:patrol/patrol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imdb_sample/config/keys.dart';
import 'package:imdb_sample/data/models/domain/movie.dart';
import 'package:imdb_sample/generated/l10n.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:integration_test/integration_test.dart';
import 'package:patrol/patrol.dart';
import 'package:imdb_sample/main.dart' as app;
import 'config.dart';

import 'config.dart';

void main() {
  // Neither with patrol or integration test from SDK tap on list item won't work on web (key can't be found)
  patrolTest(
    'when pressing native back button in android it should pop to BottomNavigationPage',
    config: patrolConfig,
    nativeAutomation: true, // run on native device
    ($) async {
      app.main();
      // first login and enter popular movies page
      await $(K.loginButton).waitUntilVisible();
      await $(K.loginButton).tap();
      await $(K.popularMoviesPage).waitUntilVisible();

      // click on one of the movies to open details
      await $.scrollUntilExists(finder: $(Key("Prey_${S.current.popular}")));
      expect($(Key("Prey_${S.current.popular}")).visible, true);
      await $(Key("Prey_${S.current.popular}")).tap();
      expect($(K.movieDetailsPage), findsOneWidget);
      await $.native.pressBack();
      await $(K.bottomNavigation).waitUntilVisible();
      expect($(K.bottomNavigation), findsOneWidget);
    },
  );
  //
  // Future<void> addDelay(int ms) async {
  //   await Future<void>.delayed(Duration(milliseconds: ms));
  // }

  // final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  //
  // testWidgets(
  //     'when pressing native back button in android it should pop to BottomNavigationPage',
  //     (tester) async {
  //   app.main();
  //   await tester.pumpAndSettle(const Duration(milliseconds: 5000));
  //   await tester.tap(find.byKey(K.loginButton));
  //   await tester.pumpAndSettle(const Duration(milliseconds: 4000));
  //   expect(find.byKey(K.bottomNavigation), findsOneWidget);
  //   await tester.pumpAndSettle();
  //   await tester.ensureVisible(find.byKey(Key("Avatar_${S.current.popular}")));
  //   await tester.tap(find.byKey(Key("Avatar_${S.current.popular}")));
  //   await tester.pumpAndSettle(const Duration(milliseconds: 2000));
  //   expect(find.byKey(K.movieDetailsPage), findsOneWidget);
  //   // native back button click for Android, Patrol has that option
  // });
}
