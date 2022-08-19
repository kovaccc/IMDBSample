import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import '../../../config/constants.dart';

@singleton
class AuthDao {
  final Box authBox;

  AuthDao(@Named(Constants.boxAuth) this.authBox);

  Future<void> insertJwtToken(String token) async {
    await authBox.put(Constants.keyJwtToken, token);
  }

  Future<void> deleteJwtToken() async {
    await authBox.delete(Constants.keyJwtToken);
  }

  String? getJwtToken() {
    return authBox.get(Constants.keyJwtToken);
  }
}
