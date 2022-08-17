import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../config/constants.dart';
import '../../../data/local/dao/genre_dao.dart';
import '../../../data/local/dao/movie_dao.dart';
import '../../../data/models/domain/genre.dart';
import '../../../data/models/persistence/db_genre.dart';
import '../../../data/models/persistence/db_movie.dart';
import '../../../di/injection.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  static String id = "/splash_page";

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}