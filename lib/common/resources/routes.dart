import 'package:flutter/cupertino.dart';
import 'package:imdb_sample/ui/presentation/pages/login_page.dart';

import '../../ui/presentation/pages/splash_page.dart';

class Routes {
  Routes._();

  static final routes = <String, WidgetBuilder>{
    SplashPage.id: (BuildContext context) {
      return const SplashPage();
    },
    LoginPage.id: (BuildContext context) {
      return const LoginPage();
    },
  };
}
