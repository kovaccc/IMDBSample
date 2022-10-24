import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imdb_sample/data/repositories/movies_repository.dart';
import 'package:imdb_sample/di/injection.dart';
import 'package:imdb_sample/ui/providers/login/login_notifier.dart';
import 'package:imdb_sample/ui/providers/login/login_state.dart';
import 'package:imdb_sample/ui/providers/movie_details/movie_details_notifier.dart';
import 'package:imdb_sample/ui/providers/movie_details/movie_details_state.dart';
import 'package:imdb_sample/ui/providers/popular_movies/popular_movies_notifier.dart';
import 'package:imdb_sample/ui/providers/popular_movies/popular_movies_state.dart';
import 'package:imdb_sample/ui/providers/splash/splash_notifier.dart';
import 'package:imdb_sample/ui/providers/splash/splash_state.dart';

import '../../../data/repositories/auth_repository.dart';
import '../../../data/repositories/genres_repository.dart';
import '../../data/models/persistence/db_movie.dart';
import 'auth/auth_notifier.dart';
import 'auth/auth_state.dart';

final loginNotifierProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>(
  (ref) {
    return LoginNotifier(
        authRepository: getIt<IAuthRepository>() as AuthRepository,
        genresRepository: getIt<IGenresRepository>() as GenresRepository);
  },
);

final authNotifierProvider =
    StateNotifierProvider.autoDispose<AuthNotifier, AuthState>(
  (ref) {
    return AuthNotifier(
      authRepository: getIt<IAuthRepository>() as AuthRepository,
    );
  },
);

final splashNotifierProvider =
    StateNotifierProvider.autoDispose<SplashNotifier, SplashState>(
  (ref) {
    return SplashNotifier(
      authRepository: getIt<IAuthRepository>() as AuthRepository,
      genresRepository: getIt<IGenresRepository>() as GenresRepository,
    )..startAuthChecking();
  },
);

// final popularMoviesNotifierProvider = StateNotifierProvider.autoDispose<
//     PopularMoviesNotifier, PopularMoviesState>(
//   (ref) {
//     return PopularMoviesNotifier(
//       moviesRepository: getIt<IMoviesRepository>() as MoviesRepository,
//     );
//   },
// );

final popularMoviesNotifierProvider = StateNotifierProvider.autoDispose<
    PopularMoviesNotifier, PopularMoviesState>(
  (ref) {
    return PopularMoviesNotifier(
      moviesRepository: getIt<IMoviesRepository>() as MoviesRepository,
    )..fetchFirstPage();
  },
);



final movieDetailsNotifierProvider =
    StateNotifierProvider.autoDispose<MovieDetailsNotifier, MovieDetailsState>(
  (ref) {
    return MovieDetailsNotifier(
      moviesRepository: getIt<IMoviesRepository>() as MoviesRepository,
    );
  },
);

final movieProvider = Provider.family<ValueListenable<Box<DBMovie>>, int>((ref,
        id) =>
    (getIt<IMoviesRepository>() as MoviesRepository).getMovieListenable(id));

final favouriteMoviesProvider = Provider<ValueListenable<Box<DBMovie>>>((ref) =>
    (getIt<IMoviesRepository>() as MoviesRepository)
        .getPopularMoviesListenable());
