import 'package:flutter_test/flutter_test.dart';
import 'package:imdb_sample/config/constants.dart';
import 'package:mockito/annotations.dart';
import 'package:imdb_sample/data/local/sources/auth_local_data_source.dart';
import 'package:imdb_sample/data/repositories/auth_repository.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([AuthLocalDataSource])
void main() {
  late AuthLocalDataSource mockAuthLocalDataSource;
  late AuthRepository authRepository;

  setUp(() {
    mockAuthLocalDataSource = MockAuthLocalDataSource();
    authRepository = AuthRepository(mockAuthLocalDataSource);
  });

  // Group tests by methods from FavoriteRepository
  group(
    'check user logged in tests',
    () {
      void setupIsLoggedIn() {
        when(mockAuthLocalDataSource.getJwtToken()).thenAnswer((_) {
          return Constants.keyJwtToken;
        });
      }

      void setupIsNotLoggedIn() {
        when(mockAuthLocalDataSource.getJwtToken()).thenAnswer((_) {
          return "";
        });
      }

      test('should return true when AuthLocalDataSource returns jwt token',
          () async {
        setupIsLoggedIn();
        expect(authRepository.isUserLoggedIn(), true);
      });

      test(
        'should return false when AuthLocalDataSource returns null or empty String',
        () async {
          setupIsNotLoggedIn();
          expect(authRepository.isUserLoggedIn(), false);
        },
      );
    },
  );
}
