import 'package:injectable/injectable.dart';

abstract class Env {
  static const development = 'development';
  static const stage = 'stage';
  static const production = 'production';
}

abstract class FlavorConfig {
  String getBaseUrl();
}

@Singleton(as: FlavorConfig, env: [Env.stage])
class StageFlavorConfig implements FlavorConfig {
  @override
  String getBaseUrl() => 'https://gw01.staging01.kikapp.io/';
}

@Singleton(as: FlavorConfig, env: [Env.development])
class DevFlavorConfig implements FlavorConfig {
  @override
  String getBaseUrl() => 'https://gw01.staging01.kikapp.io/';
}

@Singleton(as: FlavorConfig, env: [Env.production])
class ProdFlavorConfig implements FlavorConfig {
  @override
  String getBaseUrl() => 'https://gw01.internal-api.nld.kikapp.io/';
}
