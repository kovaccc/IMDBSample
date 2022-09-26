import 'package:flutter/material.dart';
import 'package:imdb_sample/data/repositories/auth_repository.dart';
import 'package:imdb_sample/ui/elements/pages/bottom_navigation/bottom_navigation_page.dart';
import 'package:imdb_sample/ui/elements/pages/login_page.dart';
import 'package:imdb_sample/ui/elements/pages/movie_details_page.dart';

import '../../di/injection.dart';
import '../../ui/elements/pages/splash_page.dart';
import 'package:beamer/beamer.dart';
import '../../../common/enums/filter_movies.dart';
import '../../../data/local/dao/movie_dao.dart';

const homePagePath = "/home";
const favouritePagePath = "/favourite_movies";
const popularPagePath = "/popular_movies";
const loginPagePath = "/login";
const splashPagePath = "/splash";
const popularMovieDetailsPath = "$homePagePath$popularPagePath/:$keyMovieId";
const favouriteMovieDetailsPath =
    "$homePagePath$favouritePagePath/:$keyMovieId";
const keyMovieId = "movieId";
const queryTab = "tab";

final routerDelegate = BeamerDelegate(
  initialPath: splashPagePath,
  locationBuilder: RoutesLocationBuilder(
    routes: {
      splashPagePath: (context, state, data) {
        return BeamPage(
            key: ValueKey(splashPagePath.substring(1)),
            title: splashPagePath.substring(1),
            child: const SplashPage());
      },
      loginPagePath: (context, state, data) {
        return BeamPage(
            key: ValueKey(loginPagePath.substring(1)),
            title: loginPagePath.substring(1),
            child: LoginPage());
      },
      homePagePath: (context, state, data) {
        final initialIndex =
            state.queryParameters[queryTab] == FilterMovies.favourite.getTitle()
                ? 1
                : 0;
        return BeamPage(
            key: ValueKey(homePagePath.substring(1)),
            // same key, you don't want rebuild when back button is clicked
            title: homePagePath.substring(1),
            child: BottomNavigationPage(initialIndex: initialIndex),
        );
      },
      popularMovieDetailsPath: (context, state, data) {
        return getMovieDetailsPage(FilterMovies.popular, state);
      },
      favouriteMovieDetailsPath: (context, state, data) {
        return getMovieDetailsPage(FilterMovies.favourite, state);
      }
    },
  ),
  guards: <BeamGuard>[
    BeamGuard(
      pathPatterns: [loginPagePath, splashPagePath],
      guardNonMatching: true,
      check: (context, location) {
        final authRepository = getIt<IAuthRepository>() as AuthRepository;
        return authRepository.isUserLoggedIn();
      },
      beamToNamed: (origin, target) => loginPagePath,
    ),
    BeamGuard(
      pathPatterns: [loginPagePath],
      check: (context, location) {
        final authRepository = getIt<IAuthRepository>() as AuthRepository;
        return authRepository.isUserLoggedIn() != true;
      },
      beamToNamed: (origin, target) => homePagePath,
    ),
  ],
);

BeamPage getMovieDetailsPage(FilterMovies type, BeamState state) {
  final movieId = state.pathParameters[keyMovieId];
  final movieDao = getIt<MovieDao>();
  final movie = movieDao.getMovie(int.tryParse(movieId ?? "") ?? -1);

  return BeamPage(
    key: ValueKey('${type.getTitle()}-movies-$movieId'),
    title: movie?.title,
    child: MovieDetailsPage(movieId: int.tryParse(movieId ?? "") ?? 0),
    onPopPage: (context, delegate, _, page) {
      delegate.update(
        configuration: RouteInformation(
          location: type.getQueryTabPath(),
        ),
        rebuild: false,
      );
      return true;
    },

  );
}
