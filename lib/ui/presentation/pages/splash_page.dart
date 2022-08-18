import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_sample/common/resources/icons.dart';
import 'package:imdb_sample/ui/presentation/pages/bottom_navigation/bottom_navigation_page.dart';
import '../../../common/resources/paddings.dart';
import '../../blocs/splash_bloc.dart';
import 'login_page.dart';

class SplashPage extends StatelessWidget {
  static const String id = "/splash_page";

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashLoginSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              BottomNavigationPage.id, (route) => false);
        } else {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(LoginPage.id, (route) => false);
        }
      },
      child: Scaffold(
          body: Image.asset(
        IMDBIcons.imdbLogo,
        height: ImdbPaddings(context).screenWidth / 5,
        width: ImdbPaddings(context).screenWidth / 5,
      )),
    );
  }
}
