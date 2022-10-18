import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imdb_sample/data/local/sources/genres_local_data_source.dart';
import 'package:imdb_sample/data/models/domain/genre.dart';
import 'package:imdb_sample/data/models/responses/genres_response.dart';
import 'package:imdb_sample/data/remote/sources/genres_remote_data_source.dart';
import 'package:imdb_sample/data/repositories/genres_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'genres_repository_test.mocks.dart';

@GenerateMocks([GenresLocalDataSource, GenresRemoteDataSource])
void main() {
  late GenresLocalDataSource mockGenresLocalDataSource;
  late GenresRemoteDataSource mockGenresRemoteDataSource;
  late GenresRepository genresRepository;

  setUp(() {
    mockGenresLocalDataSource = MockGenresLocalDataSource();
    mockGenresRemoteDataSource = MockGenresRemoteDataSource();
    genresRepository =
        GenresRepository(mockGenresLocalDataSource, mockGenresRemoteDataSource);
  });

  final genres = [
    Genre(id: 0, name: "thriller"),
    Genre(id: 0, name: "action"),
  ];

  final genreResponse = GenresResponse(genres: genres);

  void setupSuccess() {
    when(mockGenresRemoteDataSource.getGenres())
        .thenAnswer((_) async => genreResponse);
    when(mockGenresLocalDataSource.saveGenres(genreResponse.genres))
        .thenAnswer((_) async => genres);
  }

  void setupError() {
    when(mockGenresRemoteDataSource.getGenres())
        .thenThrow(DioError(requestOptions: RequestOptions(path: '')));
  }

  // Group tests by methods from RecipeRepository
  group('refresh genres tests', () {
    test(
      'should call genresRemoteDataSource.getGenres',
      () async {
        setupSuccess();
        await genresRepository.refreshGenres();
        verify(mockGenresRemoteDataSource.getGenres());
      },
    );
    test(
      'should call genresLocalDataSource.saveGenres with genres from response',
      () async {
        setupSuccess();
        await genresRepository.refreshGenres();
        verify(mockGenresLocalDataSource.saveGenres(genreResponse.genres));
      },
    );

    test(
      'should return list of genres when remote data source successfully retrieves data',
      () async {
        setupSuccess();
        final result = await genresRepository.refreshGenres();

        expect(result, genres);
      },
    );
  });

  test(
    'should return failure when remote data source unsuccessfully retrieves data',
    () async {
      setupError();
      expect(genresRepository.refreshGenres(), throwsException);
    },
  );
}
