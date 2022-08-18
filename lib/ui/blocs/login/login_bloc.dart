import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_sample/data/repositories/genres_repository.dart';

import '../../../data/repositories/auth_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  final GenresRepository genresRepository;

  LoginBloc({required this.authRepository, required this.genresRepository})
      : super(LoginInitial()) {
    on<LoginStarted>(_onLoginStarted);
  }

  void _onLoginStarted(LoginStarted event, Emitter<LoginState> emit) async {
    emit(const LoginLoading());
    await Future.delayed(const Duration(milliseconds: 3000));
    await authRepository.login();
    try {
      await genresRepository.refreshGenres();
    } catch (error) {
      if (error is Exception) {}
    }
    emit(const LoginSuccess());
  }
}
