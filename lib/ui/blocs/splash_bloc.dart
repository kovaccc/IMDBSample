import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:imdb_sample/data/repositories/auth_repository.dart';
import 'package:imdb_sample/data/repositories/genres_repository.dart';
import 'package:imdb_sample/data/repositories/movies_repository.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthRepository authRepository;
  final GenresRepository genresRepository;
  final MoviesRepository moviesRepository;

  SplashBloc(
      {required this.authRepository,
      required this.genresRepository,
      required this.moviesRepository})
      : super(SplashInitial()) {
    on<SplashLoginChecking>(_onSplashLoginChecking);
  }

  void _onSplashLoginChecking(
      SplashLoginChecking event, Emitter<SplashState> emit) async {
    emit(SplashLoading());
    await Future.delayed(const Duration(milliseconds: 3000));
    final isUserLoggedIn = authRepository.isUserLoggedIn();
    if (isUserLoggedIn) {
      emit(const SplashLoginSuccess());
    } else {
      emit(const SplashLoginFailure());
    }
  }
}
