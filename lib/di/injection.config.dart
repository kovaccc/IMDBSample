// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../config/flavor_config.dart' as _i3;
import '../data/remote/api_client.dart' as _i4;
import '../data/remote/sources/genres_remote_data_source.dart' as _i5;
import '../data/remote/sources/movies_remote_data_source.dart' as _i6;
import '../data/repositories/movies_repository.dart' as _i7;

const String _stage = 'stage';
const String _development = 'development';
const String _production = 'production';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.FlavorConfig>(_i3.StageFlavorConfig(),
      registerFor: {_stage});
  gh.singleton<_i3.FlavorConfig>(_i3.DevFlavorConfig(),
      registerFor: {_development});
  gh.singleton<_i3.FlavorConfig>(_i3.ProdFlavorConfig(),
      registerFor: {_production});
  gh.singleton<_i4.ApiClient>(_i4.ApiClient.create(get<_i3.FlavorConfig>()));
  gh.singleton<_i5.GenresRemoteDataSource>(
      _i5.GenresRemoteDataSource(get<_i4.ApiClient>()));
  gh.singleton<_i6.MoviesRemoteDataSource>(
      _i6.MoviesRemoteDataSource(get<_i4.ApiClient>()));
  gh.singleton<_i7.IMoviesRepository>(
      _i7.MoviesRepository(get<_i6.MoviesRemoteDataSource>()));
  return get;
}
