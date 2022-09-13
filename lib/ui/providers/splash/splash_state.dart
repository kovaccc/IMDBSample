import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
abstract class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;

  const factory SplashState.error() = _Error;

  const factory SplashState.loaded() = _Loaded;
}
