part of 'splash_bloc.dart';

@immutable
abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoginFailure extends SplashState {
  const SplashLoginFailure();

  @override
  List<Object> get props => [];
}

class SplashLoginSuccess extends SplashState {
  const SplashLoginSuccess();

  @override
  List<Object> get props => [];
}
