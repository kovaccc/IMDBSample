import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_sample/data/repositories/auth_repository.dart';
import 'package:imdb_sample/data/repositories/genres_repository.dart';
import 'package:imdb_sample/data/repositories/movies_repository.dart';
import 'package:imdb_sample/ui/blocs/movie_details/movie_details_bloc.dart';
import 'package:imdb_sample/ui/blocs/splash/splash_bloc.dart';
import 'package:imdb_sample/ui/elements/pages/bottom_navigation/bottom_navigation_page.dart';
import 'package:imdb_sample/ui/elements/pages/login_page.dart';
import 'package:imdb_sample/ui/elements/pages/movie_details_page.dart';

import '../../di/injection.dart';
import '../../ui/elements/pages/splash_page.dart';
import '../blocs/main/main_bloc.dart';
import '../blocs/popular_movies/popular_movies_bloc.dart';

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
      return LoginPage();
    },
    BottomNavigationPage.id: (BuildContext context) {
      return MultiBlocProvider(providers: [
        BlocProvider<PopularMoviesBloc>(
          create: (context) => PopularMoviesBloc(
              moviesRepository: getIt<IMoviesRepository>() as MoviesRepository),
        ),
        BlocProvider<MovieDetailsBloc>(
          create: (context) => MovieDetailsBloc(
              moviesRepository: getIt<IMoviesRepository>() as MoviesRepository),
        ),
        BlocProvider<MainBloc>(
          create: (context) => MainBloc(
              authRepository: getIt<IAuthRepository>() as AuthRepository),
        ),
      ], child: const BottomNavigationPage());
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

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == MovieDetailsPage.id) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) =>
            routes[MovieDetailsPage.id]!(context),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(
                Tween(begin: const Offset(3.0, 2.0), end: Offset.zero)
                    .chain(CurveTween(curve: Curves.bounceInOut))),
            child: child,
          );
        },
      );
    } else {
      return MaterialPageRoute(
          builder: (context) => routes[settings.name]!(context));
    }
  }
}
