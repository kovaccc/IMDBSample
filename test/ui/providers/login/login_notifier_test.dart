import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imdb_sample/data/repositories/auth_repository.dart';
import 'package:imdb_sample/data/repositories/genres_repository.dart';
import 'package:imdb_sample/ui/providers/login/login_notifier.dart';
import 'package:imdb_sample/ui/providers/login/login_state.dart';
import 'package:imdb_sample/ui/providers/providers.dart';
import 'package:mockito/annotations.dart';
import 'package:state_notifier_test/state_notifier_test.dart';

import 'login_notifier_test.mocks.dart';

@GenerateMocks([AuthRepository, GenresRepository])
void main() {
  late AuthRepository authRepository;
  late GenresRepository genresRepository;

  setUp(() {
    authRepository = MockAuthRepository();
    genresRepository = MockGenresRepository();
  });

  group(
    'Login notifier provider tests',
    () {
      test('Login notifier provider initial state should be LoginState.initial',
          () async {
        final container = ProviderContainer(
          overrides: [
            loginNotifierProvider.overrideWithProvider(
                AutoDisposeStateNotifierProvider((ref) => LoginNotifier(
                    authRepository: authRepository,
                    genresRepository: genresRepository))),
          ],
        );
        expect(container.read(loginNotifierProvider.notifier).state,
            const LoginState.initial());
      });

      stateNotifierTest<LoginNotifier, LoginState>(
        'Emits [LoginState.loading, LoginState.loaded] when data is fetched successfully',
        build: () => LoginNotifier(
            authRepository: authRepository, genresRepository: genresRepository),
        setUp: () async {},
        actions: (LoginNotifier stateNotifier) async {
          await stateNotifier.startLogin();
        },
        expect: () => [
          const LoginState.loading(),
          const LoginState.loaded(),
        ],
      );
    },
  );
}
