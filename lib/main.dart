import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:imdb_sample/data/models/persistence/db_genre.dart';
import 'package:imdb_sample/data/models/persistence/db_movie.dart';
import 'package:imdb_sample/data/models/persistence/db_popular_movies_page.dart';
import 'package:imdb_sample/ui/presentation/pages/splash_page.dart';
import 'package:imdb_sample/common/resources/routes.dart';

import 'common/resources/colors.dart';
import 'config/flavor_config.dart';
import 'di/injection.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  configureDependencies(Env.development);
  // await Hive.openBox(Constants.boxAuth);
  // await Hive.openBox<DBGenre>(Constants.boxGenre);
  // await Hive.openBox<DBMovie>(Constants.boxMovie);
  // await Hive.openBox<DBPopularMovies>(Constants.boxPopularMovies);
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      navigatorKey: navigator,
      theme: ThemeData(scaffoldBackgroundColor: IMDBColors.primaryBlack),
      supportedLocales: S.delegate.supportedLocales,
      title: 'IMDBSample',
      debugShowCheckedModeBanner: false,
      locale: const Locale("en"),
      routes: Routes.routes,
      initialRoute: SplashPage.id,
    );
  }
}
