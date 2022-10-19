import 'package:patrol/patrol.dart';

const patrolConfig = PatrolTestConfig(
    appName: 'IMDBSample',
    packageName: 'com.matej.imdb_sample.imdb_sample',
    bundleId: 'com.matej.imdb_sample.imdb_sample',
    visibleTimeout: Duration(seconds: 10),
    settleTimeout: Duration(seconds: 10),
    existsTimeout: Duration(seconds: 10));
