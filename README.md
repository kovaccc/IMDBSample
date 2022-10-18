# imdb_sample

A simple IMDB-like app

## Testing
To ensure that your app continues to work as you add more features or change existing functionality you need to write both unit and integration tests.

### Unit testing
- Unit tests are handy for verifying the behavior of a single function, method, or class.

Steps are explained in following example:
- Add the test or flutter_test dependency 
```sh
dev_dependencies:
  flutter_test:
    sdk: flutter
  path: ^1.8.0
```
- Create a test file in test folder located at the root of your Flutter application or package, and it should always end with _test.dart

<img width="350" alt="image" src="https://user-images.githubusercontent.com/75457058/196558398-6728b31f-e859-42be-9e18-968478c3c250.png">

- Create a class to test
```sh
@Singleton(as: IGenresRepository)
class GenresRepository implements IGenresRepository {
  final GenresLocalDataSource _genresLocalDataSource;
  final GenresRemoteDataSource _genresRemoteDataSource;

  GenresRepository(this._genresLocalDataSource, this._genresRemoteDataSource);

  @override
  Future<List<Genre>> refreshGenres() async {
    final genresResponse = await _genresRemoteDataSource.getGenres();
    return await _genresLocalDataSource.saveGenres(genresResponse.genres);
  }
}
```
- Write a test for the class and check if the results are correct by using the top-level expect function
- If you are writing tests for classes that fetch data from live web services or databases you should "mock" these dependencies to make execution of these tests faster and avoid unexpected results. 
```sh
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
}
```
- Combine multiple tests in a group using group function provided by the test package
```sh
  group('refresh genres tests', () {
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
```
- Run the tests by using following command or by clicking run in your editor 
```sh
flutter test test/data/repositories/genres_repository_test.dart
```
