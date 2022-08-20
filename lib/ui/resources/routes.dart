import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_sample/data/repositories/auth_repository.dart';
import 'package:imdb_sample/data/repositories/genres_repository.dart';
import 'package:imdb_sample/data/repositories/movies_repository.dart';
import 'package:imdb_sample/ui/blocs/login/login_bloc.dart';
import 'package:imdb_sample/ui/blocs/movie_details/movie_details_bloc.dart';
import 'package:imdb_sample/ui/blocs/splash/splash_bloc.dart';
import 'package:imdb_sample/ui/elements/pages/bottom_navigation/bottom_navigation_page.dart';
import 'package:imdb_sample/ui/elements/pages/login_page.dart';
import 'package:imdb_sample/ui/elements/pages/movie_details_page.dart';

import '../../di/injection.dart';
import '../../ui/elements/pages/splash_page.dart';

class Routes {
  Routes._();

  static final routes = <String, WidgetBuilder>{
    SplashPage.id: (BuildContext context) {
      return BlocProvider<SplashBloc>(
          create: (context) => SplashBloc(
                authRepository: getIt<IAuthRepository>() as AuthRepository,
                genresRepository:
                    getIt<IGenresRepository>() as GenresRepository,
              )..add(const SplashLoginChecking()),
          child: const SplashPage());
    },
    LoginPage.id: (BuildContext context) {
      return BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
                authRepository: getIt<IAuthRepository>() as AuthRepository,
                genresRepository:
                    getIt<IGenresRepository>() as GenresRepository,
              ),
          child: LoginPage());
    },
    BottomNavigationPage.id: (BuildContext context) {
      return const BottomNavigationPage();
    },
    MovieDetailsPage.id: (BuildContext context) {
      return BlocProvider<MovieDetailsBloc>(
          create: (context) => MovieDetailsBloc(
                moviesRepository:
                    getIt<IMoviesRepository>() as MoviesRepository,
              ),
          child: const MovieDetailsPage());
    },
  };
}
