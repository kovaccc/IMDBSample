import 'package:imdb_sample/config/secrets.dart';
import 'package:injectable/injectable.dart';
import '../local/sources/auth_local_data_source.dart';

abstract class IAuthRepository {
  Future<void> login();

  Future<void> logout();

  bool isUserLoggedIn();
}

@Singleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepository(this._authLocalDataSource);

  @override
  bool isUserLoggedIn() {
    return (_authLocalDataSource.getJwtToken() ?? "").isNotEmpty;
  }

  @override
  Future<void> login() async {
    await _authLocalDataSource.saveJwtToken(Secrets.bearerToken);
  }

  @override
  Future<void> logout() async {
    await _authLocalDataSource.deleteJwtToken();
  }
}
