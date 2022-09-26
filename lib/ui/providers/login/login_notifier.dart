import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imdb_sample/ui/providers/login/login_state.dart';

import '../../../data/repositories/auth_repository.dart';
import '../../../data/repositories/genres_repository.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final AuthRepository authRepository;
  final GenresRepository genresRepository;

  LoginNotifier({required this.authRepository, required this.genresRepository})
      : super(const LoginState.initial());

  Future<void> startLogin() async {
    state = const LoginState.loading();

    await Future.delayed(const Duration(milliseconds: 3000));
    await authRepository.login();
    try {
      await genresRepository.refreshGenres();
    } catch (error) {
      if (error is Exception) {}
    }
    state = const LoginState.loaded();
  }
}
