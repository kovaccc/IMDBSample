import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthNotifier({required this.authRepository})
      : super(const AuthState.initial());

  void startLogout() async {
    await authRepository.logout();
    state = const AuthState.signedOut();
  }
}
