import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imdb_sample/ui/providers/splash/splash_state.dart';

import '../../../data/repositories/auth_repository.dart';
import '../../../data/repositories/genres_repository.dart';

class SplashNotifier extends StateNotifier<SplashState> {
  final AuthRepository authRepository;
  final GenresRepository genresRepository;

  SplashNotifier({required this.authRepository, required this.genresRepository})
      : super(const SplashState.initial());

  void startAuthChecking() async {
    await Future.delayed(const Duration(milliseconds: 3000));

    final isUserLoggedIn = authRepository.isUserLoggedIn();
    if (isUserLoggedIn) {
      try {
        await genresRepository.refreshGenres();
      } catch (error) {
        if (error is Exception) {}
      }
      state = const SplashState.loaded();
    } else {
      state = const SplashState.error();
    }
  }
}
