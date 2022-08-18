import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_sample/data/repositories/auth_repository.dart';
import 'package:imdb_sample/data/repositories/genres_repository.dart';
import 'package:imdb_sample/data/repositories/movies_repository.dart';
import 'package:imdb_sample/ui/blocs/splash_bloc.dart';
import 'package:imdb_sample/ui/presentation/pages/bottom_navigation/bottom_navigation_page.dart';
import 'package:imdb_sample/ui/presentation/pages/login_page.dart';

import '../../di/injection.dart';
import '../../ui/presentation/pages/splash_page.dart';

class Routes {
  Routes._();

  static final routes = <String, WidgetBuilder>{
    SplashPage.id: (BuildContext context) {
      return BlocProvider<SplashBloc>(
          create: (context) => SplashBloc(
                authRepository: getIt<AuthRepository>(),
                genresRepository: getIt<GenresRepository>(),
              )..add(const SplashLoginChecking()),
          child: const SplashPage());
    },
    LoginPage.id: (BuildContext context) {
      return const LoginPage();
    },
    BottomNavigationPage.id: (BuildContext context) {
      return const BottomNavigationPage();
    },
  };
}
