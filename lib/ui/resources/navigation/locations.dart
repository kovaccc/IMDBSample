import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:imdb_sample/ui/elements/pages/bottom_navigation/bottom_navigation_page.dart';
import 'package:imdb_sample/ui/elements/pages/login_page.dart';
import 'package:imdb_sample/ui/elements/pages/movie_details_page.dart';
import 'package:imdb_sample/ui/elements/pages/splash_page.dart';

import '../../../generated/l10n.dart';

const homePage = "home";
const homePagePath = "/home";
const favouritePage = "favourite_movies";
const favouritePagePath = "/favourite_movies";
const popularPage = "popular_movies";
const popularPagePath = "/popular_movies";
const loginPage = "login";
const loginPagePath = "/login";
const splashPage = "splash";
const splashPagePath = "/splash";
const movieId = "movieId";
const queryTab = "tab";

class AuthLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [
        splashPagePath,
        loginPagePath,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      if (state.uri.pathSegments.contains(splashPage))
        const BeamPage(
          title: "Splash",
          key: ValueKey(splashPage),
          child: SplashPage(),
        ),
      if (state.uri.pathSegments.contains(loginPage))
        BeamPage(
          title: "Login",
          key: const ValueKey(loginPage),
          child: LoginPage(),
        ),
    ];
    return pages;
  }
}

class MovieDetailsLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [
        homePagePath,
        '$homePagePath$popularPagePath/:$movieId',
        '$homePagePath$favouritePagePath/:$movieId',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    var homeBottomIndex = 0;
    if (state.uri.queryParameters[queryTab]?.contains(favouritePage) ?? false) {
      homeBottomIndex = 1;
    }
    final pages = [
      if (state.uri.pathSegments.contains(homePage))
        BeamPage(
          title: "Home",
          key: const ValueKey(homePage),
          child: BottomNavigationPage(
            initialIndex: homeBottomIndex,
          ),
        ),
      if (state.pathParameters.containsKey(movieId))
        BeamPage(
          key: ValueKey('movies-${state.pathParameters[movieId]}'),
          child: MovieDetailsPage(
              movieId: int.tryParse(state.pathParameters[movieId] ?? "") ?? 0),
          onPopPage: (context, delegate, _, page) {
            var movieListType = popularPage;
            if (state.uri.pathSegments.contains(favouritePage)) {
              movieListType = favouritePage;
            }
            delegate.update(
              configuration: RouteInformation(
                location: '$homePagePath/${S.current.queryTab(movieListType)}',
              ),
              rebuild: true,
            );
            return true;
          },
        ),
    ];
    return pages;
  }
}
