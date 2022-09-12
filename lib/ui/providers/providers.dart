import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imdb_sample/data/repositories/movies_repository.dart';
import 'package:imdb_sample/di/injection.dart';
import 'package:imdb_sample/ui/providers/login/login_notifier.dart';
import 'package:imdb_sample/ui/providers/login/login_state.dart';

import '../../../data/repositories/auth_repository.dart';
import '../../../data/repositories/genres_repository.dart';
import '../../data/models/persistence/db_movie.dart';

final loginProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>(
  (ref) {
    return LoginNotifier(
        authRepository: getIt<IAuthRepository>() as AuthRepository,
        genresRepository: getIt<IGenresRepository>() as GenresRepository);
  },
);

final movieProvider = Provider.family<ValueListenable<Box<DBMovie>>, int>((ref,
        id) =>
    (getIt<IMoviesRepository>() as MoviesRepository).getMovieListenable(id));

final favouriteMoviesProvider = Provider<ValueListenable<Box<DBMovie>>>((ref) =>
    (getIt<IMoviesRepository>() as MoviesRepository)
        .getPopularMoviesListenable());
