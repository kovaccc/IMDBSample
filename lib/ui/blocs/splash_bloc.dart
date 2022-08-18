import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_sample/data/repositories/auth_repository.dart';
import 'package:imdb_sample/data/repositories/genres_repository.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthRepository authRepository;
  final GenresRepository genresRepository;

  SplashBloc({required this.authRepository, required this.genresRepository})
      : super(SplashInitial()) {
    on<SplashLoginChecking>(_onSplashLoginChecking);
  }

  void _onSplashLoginChecking(
      SplashLoginChecking event, Emitter<SplashState> emit) async {
    await Future.delayed(const Duration(milliseconds: 3000));
    final isUserLoggedIn = authRepository.isUserLoggedIn();
    if (isUserLoggedIn) {
      try {
        await genresRepository.refreshGenres();
      } catch (error) {
        if (error is Exception) {}
      }
      emit(const SplashLoginSuccess());
    } else {
      emit(const SplashLoginFailure());
    }
  }
}
