part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginStarted extends LoginEvent {
  const LoginStarted();

  @override
  List<Object?> get props => [];
}
