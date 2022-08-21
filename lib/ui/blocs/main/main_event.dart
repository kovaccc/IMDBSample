part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {
  const MainEvent();
}

class MainLogoutStarted extends MainEvent {
  const MainLogoutStarted();

  @override
  List<Object?> get props => [];
}
