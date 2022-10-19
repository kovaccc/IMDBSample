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

void main() {
  patrolTest(
    'when toggle favourite for item with title "Togo" in popular movies list it should appear in favourites list',
    config: patrolConfig,
    nativeAutomation: true, // run on native device
    ($) async {
      app.main();
      // first login and enter popular movies page
      await $(K.loginButton).waitUntilVisible();
      await $(K.loginButton).tap();
      await $(K.popularMoviesPage).waitUntilVisible();

      await $.scrollUntilExists(finder: $(Key("Togo_${S.current.popular}")));
      expect($(Key("Togo_${S.current.popular}")).visible, true);
      await $(Key("Togo_${S.current.popular}")).$(InkWell).tap();
      await $(K.favouriteMoviesTab).tap();
      expect($($(Key("Togo_${S.current.favourites}"))).visible, true);

      // you can always use tester in combination from widget_tester file provided by Flutter if PatrolTester does not have
      // some functionality
      // await $.tester.tap(find
      //         .descendant(
      //           of: find.byKey(Key("Prey_${S.current.popular}")),
      //           matching: find.byType(InkWell),
      //         )
      //         .first);
      // await $.tester.pumpAndSettle();
      // expect($(Key("Prey_${S.current.favourites}")), findsNothing);
    },
  );

  // Future<void> addDelay(int ms) async {
  //   await Future<void>.delayed(Duration(milliseconds: ms));
  // }
  //
  // IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // testWidgets(
  //     'when toggle favourite for item with title "Prey" in popular movies list it should appear in favourites list',
  //     (tester) async {
  //   app.main();
  //   // first login and enter popular movies page
  //   await tester.pumpAndSettle();
  //   await addDelay(
  //       4000); // Patrol does not require this line because it will wait until timeout to find item
  //   await tester.pumpAndSettle();
  //   await tester.tap(find.byKey(K.loginButton));
  //   await tester.pumpAndSettle();
  //   await addDelay(4000);
  //   expect(find.byKey(K.popularMoviesPage).first.evaluate().isNotEmpty, true);
  //   await tester.pumpAndSettle();
  //   expect(find.byType(PagedListView<int, Movie>), findsOneWidget);
  //   // Scroll until the item to be found appears.
  //   await tester.scrollUntilVisible(
  //     find.byKey(Key("Prey_${S.current.popular}")),
  //     500.0,
  //     scrollable: find.byType(PagedListView<int, Movie>), // _CastError -> does not work
  //   );
  //   await tester.tap(find
  //       .descendant(
  //         of: find.byKey(Key("Prey_${S.current.popular}")),
  //         matching: find.byType(InkWell),
  //       )
  //       .first);
  //   await tester.tap(find.byKey(K.favouriteMoviesTab));
  //   expect(find.byKey(Key("Prey_${S.current.favourites}")), findsOneWidget);
  // });
}
