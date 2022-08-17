// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import '../config/flavor_config.dart' as _i8;
import '../data/local/dao/auth_dao.dart' as _i3;
import '../data/local/dao/genre_dao.dart' as _i9;
import '../data/local/dao/movie_dao.dart' as _i11;
import '../data/local/dao/popular_movies_page_dao.dart' as _i13;
import '../data/local/sources/genres_local_data_source.dart' as _i10;
import '../data/local/sources/movies_local_data_source.dart' as _i12;
import '../data/local/sources/movies_pages_local_data_source.dart' as _i16;
import '../data/models/persistence/db_genre.dart' as _i5;
import '../data/models/persistence/db_movie.dart' as _i6;
import '../data/models/persistence/db_popular_movies_page.dart' as _i7;
import '../data/remote/api_client.dart' as _i14;
import '../data/remote/sources/genres_remote_data_source.dart' as _i15;
import '../data/remote/sources/movies_remote_data_source.dart' as _i17;
import '../data/repositories/movies_repository.dart' as _i18;
import 'database_module.dart' as _i19;

const String _stage = 'stage';
const String _development = 'development';
const String _production = 'production';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final databaseModule = _$DatabaseModule();
  gh.singleton<_i3.AuthDao>(_i3.AuthDao());
  await gh.singletonAsync<_i4.Box<_i5.DBGenre>>(() => databaseModule.genreBox,
      instanceName: 'DBGenre', preResolve: true);
  await gh.singletonAsync<_i4.Box<_i6.DBMovie>>(() => databaseModule.movieBox,
      instanceName: 'DBMovie', preResolve: true);
  await gh.singletonAsync<_i4.Box<_i7.DBPopularMoviesPage>>(
      () => databaseModule.popularMoviesBox,
      instanceName: 'DBPopularMoviesPage',
      preResolve: true);
  await gh.singletonAsync<_i4.Box<dynamic>>(() => databaseModule.authBox,
      instanceName: 'DBAuth', preResolve: true);
  gh.singleton<_i8.FlavorConfig>(_i8.StageFlavorConfig(),
      registerFor: {_stage});
  gh.singleton<_i8.FlavorConfig>(_i8.DevFlavorConfig(),
      registerFor: {_development});
  gh.singleton<_i8.FlavorConfig>(_i8.ProdFlavorConfig(),
      registerFor: {_production});
  gh.singleton<_i9.GenreDao>(
      _i9.GenreDao(get<_i4.Box<_i5.DBGenre>>(instanceName: 'DBGenre')));
  gh.singleton<_i10.GenresLocalDataSource>(
      _i10.GenresLocalDataSource(get<_i9.GenreDao>()));
  gh.singleton<_i11.MovieDao>(
      _i11.MovieDao(get<_i4.Box<_i6.DBMovie>>(instanceName: 'DBMovie')));
  gh.singleton<_i12.MoviesLocalDataSource>(
      _i12.MoviesLocalDataSource(get<_i11.MovieDao>(), get<_i9.GenreDao>()));
  gh.singleton<_i13.PopularMoviesPageDao>(_i13.PopularMoviesPageDao(
      get<_i4.Box<_i7.DBPopularMoviesPage>>(
          instanceName: 'DBPopularMoviesPage')));
  gh.singleton<_i14.ApiClient>(_i14.ApiClient.create(get<_i8.FlavorConfig>()));
  gh.singleton<_i15.GenresRemoteDataSource>(
      _i15.GenresRemoteDataSource(get<_i14.ApiClient>()));
  gh.singleton<_i16.MoviesPagesLocalDataSource>(
      _i16.MoviesPagesLocalDataSource(get<_i13.PopularMoviesPageDao>()));
  gh.singleton<_i17.MoviesRemoteDataSource>(
      _i17.MoviesRemoteDataSource(get<_i14.ApiClient>()));
  gh.singleton<_i18.IMoviesRepository>(_i18.MoviesRepository(
      get<_i17.MoviesRemoteDataSource>(),
      get<_i12.MoviesLocalDataSource>(),
      get<_i16.MoviesPagesLocalDataSource>()));
  return get;
}

class _$DatabaseModule extends _i19.DatabaseModule {}
