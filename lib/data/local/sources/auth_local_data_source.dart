import 'package:imdb_sample/data/local/dao/auth_dao.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthLocalDataSource {
  final AuthDao _authDao;

  AuthLocalDataSource(this._authDao);

  Future<void> saveJwtToken(String jwtToken) async {
    await _authDao.insertJwtToken(jwtToken);
  }

  Future<void> deleteJwtToken() async {
    await _authDao.deleteJwtToken();
  }

  String? getJwtToken() {
    return _authDao.getJwtToken();
  }
}
