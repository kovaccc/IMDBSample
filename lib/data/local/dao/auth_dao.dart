import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../config/constants.dart';

@singleton
class AuthDao {
  AuthDao();

  Future<void> insertJwtToken(String token) async {
    await Hive.box(Constants.boxAuth).put(Constants.keyJwtToken, token);
  }

  String? getJwtToken() {
    return Hive.box(Constants.boxAuth).get(Constants.keyJwtToken);
  }
}
