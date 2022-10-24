import 'package:imdb_sample/common/base/persistable.dart';
import 'package:imdb_sample/data/local/dao/genre_dao.dart';
import 'package:imdb_sample/data/models/domain/genre.dart';
import 'package:injectable/injectable.dart';

@singleton
class GenresLocalDataSource {
  final GenreDao _genreDao;

  GenresLocalDataSource(this._genreDao);

  Future<List<Genre>> saveGenres(List<Genre> genres) async {
    for (var genre in genres) {
      final dbGenre = _genreDao.getGenre(genre.id);
      if (dbGenre == null) {
        await _genreDao.insertGenre(genre.asDatabase());
      } else {
        dbGenre.name = genre.name;
        await _genreDao.updateGenre(dbGenre);
      }
    }
    return getGenres();
  }

  List<Genre> getGenres() {
    return _genreDao.getGenres().asDomain();
  }
}
