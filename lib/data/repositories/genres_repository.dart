import 'package:imdb_sample/data/local/sources/genres_local_data_source.dart';
import 'package:imdb_sample/data/remote/sources/genres_remote_data_source.dart';
import 'package:injectable/injectable.dart';

abstract class IGenresRepository {
  Future<void> refreshGenres();
}

@Singleton(as: IGenresRepository)
class GenresRepository implements IGenresRepository {
  final GenresLocalDataSource _genresLocalDataSource;
  final GenresRemoteDataSource _genresRemoteDataSource;

  GenresRepository(this._genresLocalDataSource, this._genresRemoteDataSource);

  @override
  Future<void> refreshGenres() async {
    final genresResponse = await _genresRemoteDataSource.getGenres();
    await _genresLocalDataSource.saveGenres(genresResponse.genres);
  }
}
