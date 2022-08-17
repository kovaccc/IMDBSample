import 'package:imdb_sample/config/constants.dart';
import 'package:injectable/injectable.dart';
import '../local/sources/auth_local_data_source.dart';

abstract class IAuthRepository {
  Future<void> login();

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
    await _authLocalDataSource.saveJwtToken(Constants.bearerToken);
  }
}