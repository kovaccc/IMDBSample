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

### Patrol
It is Flutter-first UI testing framework. It consists of the patrol package (https://pub.dev/packages/patrol), which provides a powerful API for testers and developers to use, and patrol_cli (https://pub.dev/packages/patrol_cli), the command-line tool that assists in test development and execution. Integration testing with the built-in integration_test package is quite difficult to implement and not all features are included, especially accessing features of the platform such as clicking on notifications, granting permissions and similar.

To add this package and start using it run the following command:
```sh
$ flutter pub add patrol --dev
```
### Widget testing
To test widget classes you need additional tools provided by flutter_test package:
- The WidgetTester allows building and interacting with widgets in a test environment
- Instead of test() use testWidgets() function which creates a new WidgetTester for each test
- The Finder classes allow searching for widgets in the test environment
- Matcher constants help verifying if a Finder locates a widget in the test environment

Procedure is similar to creating test for non-widget classes with some differences:
- When you create widget best way is to define unique key for it
```sh
        child: SvgPicture.asset(
          key: K.qSplashLogo,
          ImdbIcons.imdbLogo,
          height: ImdbPaddings(context).screenWidth / 5,
          width: ImdbPaddings(context).screenWidth / 5,
        ),
```
- Consider having a file where all keys are defined 
```sh
typedef K = Keys;

class Keys {
  const Keys();

  static const loginButton = Key("loginButton");
  static const qSplashLogo = Key("qSplashLogo");
}
```
- Use testWidgets function and parameter WidgetTester to build and render widget with pumpWidget method
- Use pump to schedule a frame and trigger rebuild of the widget 
- Use pumpAndSettle() which repeatedly calls pump() to wait for all animations to complete. It should be called after actions with standard animations like pumpWidget(), every tap() method, entering text in form fields etc.
- Use find() to create Finder and then you can get widget by key, type, text etc.
- To verify that widget appeared on the screen use Matcher constants (e.g. findsOneWidget)
```sh
  testWidgets(
    'verify there is icon on splash screen',
    (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MyApp()));
      await tester.pumpAndSettle();
      expect(find.byKey(K.qSplashLogo), findsOneWidget);
    },
  );
```
- If you want to use Patrol for Widget testing instead of using testWidgets() you need to use patrolTest() function to get PatrolTester by convention named $ in callback
- Patrol framework has one method for doing both pumpWidget() and pumpAndSettle()
```sh
  patrolTest(
    'verify there is icon on splash screen',
    ($) async {
      await $.pumpWidgetAndSettle(const ProviderScope(child: MyApp()));
      expect($(K.qSplashLogo), findsOneWidget);
    },
  );
```
- Widget testing is done in same way like Unit testing
