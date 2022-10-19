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
- If you are writing tests for classes that fetch data live web services or databases you should "mock" these dependencies to make execution of these tests faster and avoid unexpected results. 
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
- Widget test is runned with the same command like Unit testing

### Integration testing
Unit and widget tests are helpful for testing individual classes, functions, or widgets. Tasks that test how these components work together are performed with integration tests. There is a new framework for integration testing created by LeanCode which will be described in next chapter.

#### Patrol
It is Flutter-first UI testing framework. It consists of the patrol package (https://pub.dev/packages/patrol), which provides a powerful API for testers and developers to use, and patrol_cli (https://pub.dev/packages/patrol_cli), the command-line tool that assists in test development and execution. Integration testing with the built-in integration_test package is quite difficult to implement and not all features are included, especially accessing features of the platform such as clicking on notifications, granting permissions and similar.

To add this package and start using it run the following command:
```sh
$ flutter pub add patrol --dev
```

- If you want to use Patrol for Widget testing instead of using testWidgets() you need to use patrolTest() function to get more powerful PatrolTester by convention named $ in callback
- Patrol framework has one method for doing both pumpWidget() and pumpAndSettle()
- Custom finders enable accessing widgets with $ by key (recommended), type or text that widgets contain
- Running this test is in the same way as normal widget test
```sh
  patrolTest(
    'verify there is icon on splash screen',
    ($) async {
      await $.pumpWidgetAndSettle(const ProviderScope(child: MyApp()));
      expect($(K.qSplashLogo), findsOneWidget);
    },
  );
```

- In order to be able to use command-line tool patrol_cli in terminal follow next steps:
  - activate patrol_cli  
    ```sh
    dart pub global activate patrol_cli
    ```
  - add appropriate directories to PATH
    ```sh
    export PATH="$PATH":"$HOME/.pub-cache/bin"
    export ANDROID_HOME=/Users/mkovacevic/Library/Android/sdk
    export PATH=$ANDROID_HOME/platform-tools:$PATH
    export PATH=$ANDROID_HOME/tools:$PATH
    ```
    
- To setup Patrol for integration tests run following command:
```sh
$ patrol bootstrap
```
- This command will add necessary packages, create needed file test_driver/integration_test.dart and its content, and add additional default test

- To run integration test using following command:
```sh
patrol drive -t integration_test/details_back_pressed_test.dart 
```
- Next integration test is example that shows one of the flows in application (Button tapping, scrolling PagedListView)
- First part of flow is done with PatrolTester and second part with WidgetTester 
- From example it can be seen that writing test with patrol is much more straightforward than writing it with standard test methods provided by Flutter SDK 
- Accessing nested InkWell widget is much easier with Patrol and pumpAndSettle() is not needed after every interaction with UI what is the case with WidgetTester

```sh
patrolTest(
    'when toggle favourite for item with title "Prey" in popular movies list it should appear in favourites list',
    config: patrolConfig,
    nativeAutomation: true, // run on native device
    ($) async {
      app.main();
      // first login and enter popular movies page
      await $(K.loginButton).waitUntilVisible();
      await $(K.loginButton).tap();
      await $(K.popularMoviesPage).waitUntilVisible();

      await $.scrollUntilExists(finder: $(Key("Prey_${S.current.popular}")));
      expect($(Key("Prey_${S.current.popular}")).visible, true);
      await $(Key("Prey_${S.current.popular}")).$(InkWell).tap();
      await $(K.favouriteMoviesTab).tap();
      expect($($(Key("Prey_${S.current.favourites}"))).visible, true);

      // you can always use PatrolTester in combination with WidgetTester provided by Flutter if 
      // some functionality
      // await $.tester.tap(find
      //         .descendant(
      //           of: find.byKey(Key("Prey_${S.current.popular}")),
      //           matching: find.byType(InkWell),
      //         )
      //         .first);
      // await $.tester.pumpAndSettle();
      // expect($(Key("Prey_${S.current.favourites}")), findsNothing);
    },
  );
```

- Next example shows how await keyword has different behaviour with patrol and widget tester
```sh
void main() {
  patrolTest(
    'click to button login should navigate to main screen',
    config: patrolConfig,
    nativeAutomation: true, // run on native device
    ($) async {
      app.main();
      // await $(K.loginButton).waitUntilVisible(); This line is not needed
      await $(K.loginButton).tap();
      expect($(K.bottomNavigation), findsOneWidget);
    },
  );

  // IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // testWidgets('click to button login should navigate to main screen',
  //     (tester) async {
  //   app.main();
  //   await tester.pumpAndSettle(const Duration(
  //       milliseconds:
  //           5000)); // Patrol does not require this line because it will wait until timeout to find item
  //   await tester.tap(find.byKey(K.loginButton));
  //   await tester.pumpAndSettle();
  //   expect(find.byKey(K.bottomNavigation), findsOneWidget);
  // });
}
```
- testWidgets will immediately attempt to click loginButton and if it is not visible on the screen it will throw exception, that is why delay is needed in pumpAndSettle() method
- patrolTest doesn't need delays it is all handled by await keyword. It attempts to find loginButton on the screen and if it is not visible immediately it keeps trying until it finds it or throws an exception if it reaches timeout 
- Timeout can be set globally in configurations
```sh
const patrolConfig = PatrolTestConfig(
    appName: 'IMDBSample',
    packageName: 'com.matej.imdb_sample.imdb_sample',
    bundleId: 'com.matej.imdb_sample.imdb_sample',
    visibleTimeout: Duration(seconds: 10),
    settleTimeout: Duration(seconds: 10),
    existsTimeout: Duration(seconds: 10));
```
- Timeout can also be set at same place where you call method on widget
```sh
await $(K.loginButton).tap(visibleTimeout: Duration(seconds: 10));
```

- Patrol also supports native capabilites for iOS and Android, and enables interaction with the OS where Flutter app is running on
- For native interactions it is using Native Automator available as $.native 
- Be careful to add condition if native feature is only available on one Platform like in next code
```sh
 patrolTest(
    'when pressing native back button in android it should pop to BottomNavigationPage',
    config: patrolConfig,
    nativeAutomation: true, // run on native device
    ($) async {
      app.main();
      // first login and enter popular movies page
      await $(K.loginButton).waitUntilVisible();
      await $(K.loginButton).tap();
      await $(K.popularMoviesPage).waitUntilVisible();

      // click on one of the movies to open details
      await $.scrollUntilExists(finder: $(Key("Prey_${S.current.popular}")));
      expect($(Key("Prey_${S.current.popular}")).visible, true);
      await $(Key("Prey_${S.current.popular}")).tap();
      expect($(K.movieDetailsPage), findsOneWidget);
      if(Platform.isAndroid) {
        await $.native.pressBack();
        await $(K.bottomNavigation).waitUntilVisible();
        expect($(K.bottomNavigation), findsOneWidget);
      }
    },
  );
```
- One note: with scrollUntilVisible() from WidgetTester it is not possible to scroll PagedListView and potentialy other widgets and with Patrol scrollUntilExists() there is no similar issues. Also there could be issues with finding items when running tests on Web, at least it was noticed at Chrome browser
