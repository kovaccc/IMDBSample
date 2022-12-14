# Flutter Testing
To ensure that your app continues to work as you add more features or change existing functionality you need to write both  **unit** and  **integration** tests.

## Unit testing
---
- Unit tests are handy for verifying the behavior of a **single** function, method, or class.

**Steps** are explained in following example:
- Add the **test** or **flutter_test** dependency 
```sh
dev_dependencies:
  flutter_test:
    sdk: flutter
  path: ^1.8.0
```
- Create a **test file** in test folder located at the root of your Flutter application or package, and it should always end with **_test.dart**

<img width="370" alt="image" src="https://user-images.githubusercontent.com/75457058/196960162-ffd75c6a-6e01-40de-bdf0-72d747b49dd0.png">

- Create **a class** to test
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
- Write a test for the class and check if the results are correct by using the top-level **expect function**
- If you are writing tests for classes that fetch data from live web services or databases you should **"mock"** these dependencies to make execution of these tests **faster** and avoid **unexpected** results. 
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
- Combine multiple tests in **a group** using group function provided by the test package
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
- **Run** the tests by using following command or by clicking run in your editor 
```sh
flutter test test/data/repositories/genres_repository_test.dart
```

- If you want to know more about Unit testing and explore more structured examples you can check following [blog](https://q.agency/blog/tdd-in-flutter-with-example-application-using-riverpod-and-firebase/)

## Widget testing
---
To test widget classes you need additional tools provided by flutter_test package:
- The **WidgetTester** allows building and interacting with widgets in a test environment
- Instead of test() use **testWidgets()** function which creates a new WidgetTester for each test
- **The Finder** classes allow searching for widgets in the test environment
- **Matcher constants** help verifying if a Finder locates a widget in the test environment

Procedure is similar to creating test for non-widget classes with some differences:
- When you create widget best way is to define **unique key** for it
```sh
        child: SvgPicture.asset(
          key: K.qSplashLogo,
          ImdbIcons.imdbLogo,
          height: ImdbPaddings(context).screenWidth / 5,
          width: ImdbPaddings(context).screenWidth / 5,
        ),
```
- Consider having a file where **all keys** are defined 
```sh
typedef K = Keys;

class Keys {
  const Keys();

  static const loginButton = Key("loginButton");
  static const qSplashLogo = Key("qSplashLogo");
}
```
- Use **testWidgets** function and parameter **WidgetTester** to build and render widget with pumpWidget method
- Use **pump()** to schedule a frame and trigger rebuild of the widget 
- Use **pumpAndSettle()** to repeatedly call pump() to wait for all animations to complete. It should be called after actions with standard animations like **pumpWidget()**, every **tap()** method, entering text in form fields etc.
- Use **find()** to create Finder and then you can get widget by key, widget type, text etc.
- To verify that widget appeared on the screen use **Matcher** constants (e.g. findsOneWidget)
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
- Widget test is **runned** with the same command like it is in Unit testing

## Integration testing
---
Unit and widget tests are helpful for testing individual classes, functions, or widgets. Tasks that test how these components **work together** are performed with **integration tests**. There is a new framework for integration testing created by **LeanCode** which will be described in next chapter.

### Patrol
**Flutter-first** UI testing framework. It consists of the [patrol package](https://pub.dev/packages/patrol), which provides a powerful API for testers and developers to use, and [patrol_cli](https://pub.dev/packages/patrol_cli), **the command-line** tool that assists in test development and execution. Integration testing with the built-in [integration_test](https://github.com/flutter/flutter/tree/main/packages/integration_test) package is quite difficult to implement and not all features are included, especially accessing features of the platform such as clicking on notifications, granting permissions and similar.

To add **Patrol package** in project and start using it run the following command:
```sh
$ flutter pub add patrol --dev
```

- If you want to use Patrol for **Widget testing** instead of using testWidgets() you need to use **patrolTest()** function to get more powerful PatrolTester by convention named **$** in callback
- Patrol framework has one method for doing both pumpWidget() and pumpAndSettle()
- Custom finders enable accessing widgets with $ by **key (recommended)**, type or text that widgets contain
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

#### Setup
- In order to be able to use **command-line tool** patrol_cli in terminal follow next **steps**:
  - activate **patrol_cli**  
    ```sh
    dart pub global activate patrol_cli
    ```
  - add appropriate directories to **PATH** (replace placeholders)
    ```sh
    export PATH="$PATH":"$HOME/.pub-cache/bin"
    export ANDROID_HOME=/Users/{user_name}/Library/Android/sdk
    export PATH=$ANDROID_HOME/platform-tools:$PATH
    export PATH=$ANDROID_HOME/tools:$PATH
    ```
    
- To setup Patrol for **integration tests** run following command:
```sh
$ patrol bootstrap
```
- This command will add  **necessary packages**, create needed file  **test_driver/integration_test.dart** and its content, and add additional default test

- To  **run** integration test use following command:
```sh
patrol drive -t integration_test/details_back_pressed_test.dart 
```
- Patrol is intended to use for **iOS and Android** native platforms. If you want to run tests on **web** you will need to follow steps from [Flutter official documentation](https://docs.flutter.dev/cookbook/testing/integration/introduction) and use testWidgets() instead of the Patrol framework
- When you installing **ChromeDriver** install version that is compatible with your Chrome Browser otherwise framework will throw **SessionNotCreatedException**
- Steps to run it on **the Web** are next:
    - Launch chromedriver
    ```sh
        {path_to_chrome_driver_file} --port=4444
    ```
    
    - Run test
     ```sh
        flutter drive \
        --driver=test_driver/integration_test.dart \
        --target=integration_test/login_test.dart \
  -d chrome
    ```
- You need **internet connection** to run patrol drive 

#### Implementation
- Next integration test is example that shows one of **the flows** in application (Button tapping, scrolling PagedListView)
- First part of flow is done with **PatrolTester** and second part with **WidgetTester** 
- From example it can be seen that writing test with patrol is much more **straightforward** than writing it with standard test methods provided by Flutter SDK 
- Accessing nested **InkWell** widget is much easier with Patrol and **pumpAndSettle()** is not needed after every interaction with UI what is the case with WidgetTester

```sh
patrolTest(
    'when toggle favourite for one of the movies in popular movies list, one movie item should appear in favourites list',
    config: patrolConfig,
    nativeAutomation: true, // run on native device
    ($) async {
      const index = 10;
      await app.main();
      await $.pumpAndSettle();
      final authRepo = getIt<IAuthRepository>() as AuthRepository;
      if (!authRepo.isUserLoggedIn()) {
        // first need to login
        await $(K.loginButton).waitUntilVisible();
        await $(K.loginButton).tap();
      }
      await $(K.popularMoviesPage).waitUntilVisible();

      await $.scrollUntilExists(
          finder: $(Key("${index}_${S.current.popular}")));
      expect($(Key("${index}_${S.current.popular}")).visible, true);
      await $(Key("${index}_${S.current.popular}")).$(InkWell).tap();
      await $(K.favouriteMoviesTab).tap();
      expect($(Key("${0}_${S.current.favourites}")),
          findsOneWidget); // finds added item on first index

      // you can always use tester in combination from widget_tester file provided by Flutter if PatrolTester does not have
      // some functionality
      // await $.tester.tap(find
      //         .descendant(
      //           of: find.byKey(Key("${0}_${S.current.favourites}")),
      //           matching: find.byType(InkWell),
      //         )
      //         .first);
      // await $.tester.pumpAndSettle();
      // expect($(Key("${index}_${S.current.favourites}")), findsNothing);
    },
  );
```

- Next example shows how **await** keyword has different behaviour with patrol and widget tester
```sh
void main() {
  patrolTest(
    'clicking button login should navigate to main screen',
    config: patrolConfig,
    nativeAutomation: true, // run on native device
    ($) async {
      await app.main();
      // await $(K.loginButton).waitUntilVisible(); This line is not needed
      await $(K.loginButton).tap();
      expect($(K.bottomNavigation), findsOneWidget);
    },
  );

  // IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // testWidgets('clicking button login should navigate to main screen',
  //     (tester) async {
  //   await app.main();
  //   await tester.pumpAndSettle(const Duration(
  //       milliseconds:
  //           5000)); // Patrol does not require this line because it will wait until timeout to find item
  //   await tester.tap(find.byKey(K.loginButton));
  //   await tester.pumpAndSettle();
  //   expect(find.byKey(K.bottomNavigation), findsOneWidget);
  // });
}
```
- **testWidgets** method will immediately attempt to click loginButton and if it is not visible on the screen it will throw exception, that is why delay is needed in **pumpAndSettle()** method
- patrolTest doesn't need delays it is all handled by **await** keyword. It attempts to find loginButton on the screen and if it is not visible immediately it keeps trying until it finds it or throws an exception if it reaches **timeout** 
- **Timeout** can be set globally in **configurations**
```sh
const patrolConfig = PatrolTestConfig(
    appName: 'IMDBSample',
    packageName: 'com.matej.imdb_sample.imdb_sample',
    bundleId: 'com.matej.imdb_sample.imdb_sample',
    visibleTimeout: Duration(seconds: 10),
    settleTimeout: Duration(seconds: 10),
    existsTimeout: Duration(seconds: 10));
```
- Timeout can also be set at **same place** where you call method on widget
```sh
await $(K.loginButton).tap(visibleTimeout: Duration(seconds: 10));
```

- Patrol also supports **native capabilites** for iOS and Android, and enables interaction with **the OS** where Flutter app is running on
- For native interactions it is using **Native Automator** available as **$.native**
- Be careful to add **condition** if native feature is only available on one platform like it is the case in the next code
```sh
 patrolTest(
    'when pressing native back button in android it should pop to BottomNavigationPage',
    config: patrolConfig,
    nativeAutomation: true, // run on native device
    ($) async {
      const index = 10;
      await app.main();
      await $.pumpAndSettle();
      final authRepo = getIt<IAuthRepository>() as AuthRepository;
      if (!authRepo.isUserLoggedIn()) {
        // first login
        await $(K.loginButton).waitUntilVisible();
        await $(K.loginButton).tap();
      }
      await $(K.popularMoviesPage).waitUntilVisible();

      // click on one of the movies to open details
      await $.scrollUntilExists(
          finder: $(Key("${index}_${S.current.popular}")));
      expect($(Key("${index}_${S.current.popular}")).visible, true);
      await $(Key("${index}_${S.current.popular}")).tap();
      expect($(K.movieDetailsPage), findsOneWidget);
      if (Platform.isAndroid) {
        await $.native.pressBack();
        await $(K.bottomNavigation).waitUntilVisible();
        expect($(K.bottomNavigation), findsOneWidget);
      }
    },
  );
```
- One detail found while testing is that with **scrollUntilVisible()** from WidgetTester it is not possible to scroll PagedListView and potentialy other widgets and with Patrol **scrollUntilExists()** there is no such an issue. Also there could be issues with finding items when running tests on Web, at least it was noticed at **Chrome browser**

```sh
    await tester.scrollUntilVisible(
      find.byKey(Key("${index}_${S.current.popular}")),
      500.0,
      scrollable: find.byType(PagedListView<int, Movie>), // _CastError -> does not work
    );
```

- On next image there is a list of available features that can be tested with Patrol **NativeAutomator**

<img width="1135" alt="image" src="https://user-images.githubusercontent.com/75457058/196810054-f59ad714-5ba3-4368-b3b6-1b9a92f0ca3c.png">

- **Bluetooth** does not have API method in Patrol for Android but can be tested by manually selecting it in **quick settings** 
- Extra check is added for Android version because settings could **look different** on other versions and manually adjusting the code is needed

```sh
     patrolTest(
    'taps around',
    config: patrolConfig,
    nativeAutomation: true,
    ($) async {
      if (Platform.isAndroid) {
        var androidInfo = await DeviceInfoPlugin().androidInfo;
        var release = androidInfo.version.release;
        if (release == "12") {
          // enable and disable bluetooth
          await $.native.openQuickSettings();
          await $.native.tap(Selector(text: 'Bluetooth'));
          await $.native.tap(Selector(text: 'Off'));
          await Future.delayed(const Duration(seconds: 2));
          await $.native.tap(Selector(text: 'On'));
          await $.native.tap(Selector(text: 'Done'));
          await $.native.pressBack();
          await $.native.pressBack();
        }
      }
    }
```

- Unfortunately, same code is not working for enabling/disabling **Airplane** mode and Location since it is not finding **targeted text**
- There is API-s for this features available for iOS but be careful that **Control Center** is not enabled on simulator only on real device 

```sh
      if (Platform.isIOS) {
        // enable and disable bluetooth with API
        await $.native.enableBluetooth();
        await Future.delayed(const Duration(seconds: 2));
        await $.native.disableBluetooth();

        // enable and disable Airplane mode with API
        await $.native.enableAirplaneMode();
        await Future.delayed(const Duration(seconds: 2));
        await $.native.disableAirplaneMode();
      }
```

- With Patrol is also possible to test **push notifications**. When accessing notification with method **tapOnNotificationByIndex()** index is starting from bottom to top
```sh
      await $.native.openNotifications();
      final notifications = await $.native.getNotifications();
      $.log('Found ${notifications.length} notifications');
      notifications.forEach($.log);
      // from bottom to top
      await $.native.tapOnNotificationByIndex(2);
```

- There is a lot more great **features** that can be used when writing integration tests like **permission handling**, **select accuracy** if permission prompt is location prompt, interacting with **WebView** and much more. More examples can be found at Patrol official [github repository](https://github.com/leancodepl/patrol/tree/master/packages/patrol/example/integration_test) 

- For more information and guides about this package you can check [patrol official documentation](https://patrol.leancode.co/) 
