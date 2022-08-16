import 'package:flutter/cupertino.dart';

import '../../ui/presentation/pages/splash_page.dart';

class Routes {
  Routes._();

  static final routes = <String, WidgetBuilder>{
    SplashPage.id: (BuildContext context) {
      return const SplashPage();
    },
  };
}
