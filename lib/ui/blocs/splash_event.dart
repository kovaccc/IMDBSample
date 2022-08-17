part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class SplashLoginChecking extends SplashEvent {
  const SplashLoginChecking();

  @override
  List<Object?> get props => [];
}
