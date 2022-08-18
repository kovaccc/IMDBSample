import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:imdb_sample/ui/blocs/splash/splash_bloc.dart';
import 'package:imdb_sample/ui/presentation/pages/splash_page.dart';
import 'package:imdb_sample/ui/resources/colors.dart';
import 'package:imdb_sample/ui/resources/routes.dart';
import 'config/flavor_config.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/genres_repository.dart';
import 'di/injection.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await configureDependencies(Env.development);
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.portraitUp]);
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      navigatorKey: navigator,
      theme: ThemeData(scaffoldBackgroundColor: ImdbColors.primaryBlack),
      supportedLocales: S.delegate.supportedLocales,
      title: 'IMDBSample',
      debugShowCheckedModeBanner: false,
      locale: const Locale("en"),
      routes: Routes.routes,
      home: BlocProvider<SplashBloc>(
          create: (context) => SplashBloc(
                authRepository: getIt<IAuthRepository>() as AuthRepository,
                genresRepository: getIt<IGenresRepository>() as GenresRepository,
              )..add(const SplashLoginChecking()),
          child: const SplashPage()),
    );
  }
}
