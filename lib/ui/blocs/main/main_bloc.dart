import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/auth_repository.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final AuthRepository authRepository;

  MainBloc({required this.authRepository}) : super(MainInitial()) {
    on<MainLogoutStarted>(_onMainLogoutStarted);
  }

  void _onMainLogoutStarted(
      MainLogoutStarted event, Emitter<MainState> emit) async {
    await authRepository.logout();
    emit(const MainLogoutSuccess());
  }
}
