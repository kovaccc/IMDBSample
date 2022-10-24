// Mock dependencies

import 'package:flutter_test/flutter_test.dart';
import 'package:imdb_sample/data/models/domain/genre.dart';
import 'package:imdb_sample/data/models/domain/movie.dart';
import 'package:imdb_sample/data/models/responses/popular_movies_response.dart';
import 'package:imdb_sample/data/repositories/movies_repository.dart';
import 'package:imdb_sample/ui/providers/popular_movies/popular_movies_notifier.dart';
import 'package:imdb_sample/ui/providers/popular_movies/popular_movies_state.dart';
import 'package:imdb_sample/util/error_handler.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:state_notifier_test/state_notifier_test.dart';

import 'popular_movies_notifier_test.mocks.dart';

@GenerateMocks([MoviesRepository])
void main() {
  late MoviesRepository mockMoviesRepository;

  setUp(() {
    mockMoviesRepository = MockMoviesRepository();
  });

  final movieList = [
    Movie(
        backdropPath:
            "https://cdn.britannica.com/86/192386-050-D7F3126D/Muhammad-Ali-American.jpg",
        genres: [Genre(id: 0, name: "Action")],
        id: 2010,
        overview: "Overview",
        posterPath:
            "https://cdn.britannica.com/86/192386-050-D7F3126D/Muhammad-Ali-American.jpg",
        title: "Sonic",
        voteAverage: 9.5,
        isFavourite: true),
    Movie(
        backdropPath:
            "https://cdn.britannica.com/86/192386-050-D7F3126D/Muhammad-Ali-American.jpg",
        genres: [Genre(id: 2, name: "Horror")],
        id: 2019,
        overview: "Overview",
        posterPath:
            "https://cdn.britannica.com/86/192386-050-D7F3126D/Muhammad-Ali-American.jpg",
        title: "Anabelle",
        voteAverage: 9.8,
        isFavourite: true)
  ];

  final popularMoviesResponse = PopularMoviesResponse(
      page: 2, results: [], totalPages: 21, totalResults: 3123);

  stateNotifierTest<PopularMoviesNotifier, PopularMoviesState>(
      'Emits [] when no methods are called',
      build: () =>
          PopularMoviesNotifier(moviesRepository: mockMoviesRepository),
      actions: (_) {},
      expect: () => []);

  group('fetch popular movies page tests', () {
    stateNotifierTest<PopularMoviesNotifier, PopularMoviesState>(
      'Emits [loaded] when movies are fetched successfully',
      build: () =>
          PopularMoviesNotifier(moviesRepository: mockMoviesRepository),
      setUp: () async {
        when(mockMoviesRepository.fetchPopularMoviesPage(1))
            .thenAnswer((invocation) async {
          return Future<List<Movie>>(() => Future.value(movieList));
        });

        when(mockMoviesRepository.getRemoteMoviesByPage(2))
            .thenAnswer((invocation) async {
          return Future<PopularMoviesResponse>(
              () => Future.value(popularMoviesResponse));
        });
      },
      actions: (PopularMoviesNotifier stateNotifier) async {
        await stateNotifier.fetchNextPopularMovies(0);
      },
      expect: () => [
        PopularMoviesState.loaded(
            movies: movieList, currentPage: 1, isLastPage: false),
      ],
    );

    stateNotifierTest<PopularMoviesNotifier, PopularMoviesState>(
      'Emits [PopularMoviesState.error] with PageNumberError and isLastPage=true when there is no movie pages to fetch',
      build: () =>
          PopularMoviesNotifier(moviesRepository: mockMoviesRepository),
      setUp: () async {
        when(mockMoviesRepository.fetchPopularMoviesPage(1))
            .thenAnswer((invocation) async {
          return Future<List<Movie>>(() => Future.value(movieList));
        });

        when(mockMoviesRepository.getRemoteMoviesByPage(2))
            .thenAnswer((invocation) async {
          throw const PageNumberError();
        });

        when(mockMoviesRepository.getPersistPopularMoviesByPage(1))
            .thenAnswer((invocation) {
          return movieList;
        });
      },
      actions: (PopularMoviesNotifier stateNotifier) async {
        await stateNotifier.fetchNextPopularMovies(0);
      },
      expect: () => [
        PopularMoviesState.error(
            movies: movieList,
            currentPage: 1,
            isLastPage: true,
            error: const PageNumberError()),
      ],
    );
  });
}
