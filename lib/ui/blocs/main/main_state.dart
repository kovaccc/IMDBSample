part of 'main_bloc.dart';

@immutable
abstract class MainState extends Equatable {
  const MainState();
}

class MainInitial extends MainState {
  @override
  List<Object> get props => [];
}

class MainLogoutSuccess extends MainState {
  const MainLogoutSuccess();

  @override
  List<Object> get props => [];
}
